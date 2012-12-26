package com.taobao.tasty.manager.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.constant.SqlTemplate;
import com.taobao.tasty.common.constant.SystemConstant;
import com.taobao.tasty.common.msg.BaseResult;
import com.taobao.tasty.common.msg.Message;
import com.taobao.tasty.common.msg.MessageList;
import com.taobao.tasty.manager.CommentManager;
import com.taobao.tasty.manager.MsgManager;

import common.toolkit.java.entity.db.DBConnectionResource;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.db.DbcpUtil;

public class MsgManagerImpl implements MsgManager {

	private static final Logger LOG = Logger.getLogger(CommentManager.class);

	private DataSimulator sim = DataSimulator.getInstance();
	/** 插入心消息 */
	private static final String INSERT_NEW_MESSAGE = "insert into message (group_id,source_id,target_id,msg,gmt_create) "
			+ "values ('${groupId}', '${source_id}',' ${target_id}', '${msg}', NOW())";

	private static final String QUERY_MSG_STATUS = "select * from message_status where user_id = '${source_id}'";

	private static final String UPDATE_MSG_STATUS = "update message_status set count = 0, last_id = ${last_id} where user_id = '${source_id}'";

	private static final String ADD_MSG_COUNT = "update message_status set count = count + 1 where user_id = '${source_id}'";

	private static final String QUERY_NEW_MESSAGE = "select * from message where group_id = '${group_id}' and id > ${last_id}";

	private static final String QUERY_HISTORY_MESSAGE = "select * from message where group_id = '${group_id}' and id < ${base_Id} order by id desc limit 0,${page_size}";

	// 发送消息的对外接口
	@Override
	public MessageList sendMsg(String userId, String targetId, String message) {
		MessageList result = new MessageList();
		result.setResult(false);
		Map<String, String> values = new HashMap<String, String>();
		String groupId;
		if (userId.compareToIgnoreCase(targetId) > 0) {
			groupId = format(targetId) + format(userId);
		} else {
			groupId = format(userId) + format(targetId);
		}

		values.put("groupId", groupId);
		values.put("source_id", userId);
		values.put("target_id", targetId);
		values.put("msg", message);

		try {
			int r = DbcpUtil.executeInsert(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							INSERT_NEW_MESSAGE, values)));
			if (1 == r) {
				/*
				 * DBConnectionResource dbResult =
				 * DbcpUtil.executeQuery("select LAST_INSERT_ID()"); if
				 * (dbResult != null) { ResultSet rs = dbResult.resultSet;
				 * String id; if(rs.next()){ id = rs.getString(1);
				 * values.put("last_id", id); }
				 */
				try {
					r = DbcpUtil.executeUpdate(StringUtil
							.replaceSequenced(StringUtil.replacePlaceholder(
									ADD_MSG_COUNT, values)));
					if (r > 0) {
						result = getNewMessages(values);
					} else {
						result.setResult(false);
						result.setState(BaseResult.STATE_ERROR);
					}
				} catch (Exception e) {
					// do nothing;
				}
				/*
				 * }
				 */
			}
		} catch (Exception e) {
			e.printStackTrace();
			LOG.info("发送消息失败，发送者ID：" + userId + " 接收者ID：" + targetId + " 消息内容："
					+ message);

		}
		return result;
	}

	// 获取消息的对外接口
	@Override
	public MessageList getMsg(String userId, String targetId, int type,
			String param) {
		Map<String, String> values = new HashMap<String, String>();
		MessageList result = null;

		String groupId;
		if (userId.compareToIgnoreCase(targetId) > 0) {
			groupId = format(targetId) + format(userId);
		} else {
			groupId = format(userId) + format(targetId);
		}
		values.put("group_id", groupId);
		values.put("source_id", userId);

		switch (type) {
		case 0:
			result = getNewMessages(values);
			break;
		case 1:
			values.put("base_Id", param);
			values.put("page_size",
					String.valueOf(SystemConstant.PAGE_SIZE_OF_FEED));
			result = getHistoryMessages(values);
			break;
		}

		return result;
	}

	// 获取最新的聊天信息，会更新信息状态表
	private MessageList getNewMessages(Map<String, String> values) {
		MessageList msgList = new MessageList();
		List<Message> list;
		DBConnectionResource dbResult = null;
		ResultSet rs = null;
		try {
			dbResult = DbcpUtil.executeQuery(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_MSG_STATUS, values)));
			rs = dbResult.resultSet;

			if (rs.next()) {
				values.put("last_id", rs.getString(5));
			} else {
				values.put("last_id", "0");
			}

			dbResult = DbcpUtil.executeQuery(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_NEW_MESSAGE, values)));
			list = conbineMessages(dbResult);
			msgList.setMessageList(list);

			if (list.size() > 0) {
				String lastId = list.get(list.size() - 1).getId();
				values.put("last_id", lastId);
				DbcpUtil.executeUpdate(StringUtil.replaceSequenced(StringUtil
						.replacePlaceholder(UPDATE_MSG_STATUS, values)));
			}
			msgList.setResult(true);
			msgList.setState(BaseResult.STATE_OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if ( null != rs ) {
				DbcpUtil.closeResultSetAndStatement( rs, dbResult.statement );
				DbcpUtil.returnBackConnectionToPool( dbResult.connection );
			}
		}
		return msgList;
	}

	// 获取历史信息，根据最有一次取得的id来获取
	private MessageList getHistoryMessages(Map<String, String> values) {
		MessageList msgList = new MessageList();
		DBConnectionResource dbResult = null;
		try {
			dbResult = DbcpUtil.executeQuery(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_HISTORY_MESSAGE, values)));
			msgList.setMessageList(conbineMessages(dbResult));
			msgList.setState(BaseResult.STATE_OK);
			msgList.setPageSize(Integer.parseInt(values.get("page_size")));
			msgList.setResult(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if ( null != dbResult ) {
				DbcpUtil.closeResultSetAndStatement( dbResult.resultSet, dbResult.statement );
				DbcpUtil.returnBackConnectionToPool( dbResult.connection );
			}
		}
		return msgList;
	}

	// 把结果组装进list
	private List<Message> conbineMessages(DBConnectionResource dbResult)
			throws SQLException {
		ResultSet rs = dbResult.resultSet;
		List<Message> list = new ArrayList<Message>();
		while (rs.next()) {
			Message msg = new Message(rs.getString(3), rs.getString(4),
					rs.getString(5));
			msg.setId(rs.getString(1));
			list.add(msg);
		}
		return list;
	}

	private String format(String str) {
		while (str.length() < 10) {
			str = "0" + str;
		}
		return str;
	}
}
