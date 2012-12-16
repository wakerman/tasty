package com.taobao.tasty.manager.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.constant.SqlTemplate;
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
	/** 插入心消息*/
	private static final String INSERT_NEW_MESSAGE = "insert into message (group_id,source_id,target_id,msg,gmt_create) "
			+ "values ('${groupId}', '${source_id}',' ${target_id}', '${msg}', NOW())";
	private static final String UPDATE_MSG_STATUS = "update message_status set count = count + 1, last_id = ${last_id} where user_id = '${source_id}'";
	
	private static final String QUERY_NEW_MESSAGE = "select * from message where group_id = '${group_id}' and id > ${lastId}";
	
	@Override
	public BaseResult sendMsg(String userId, String targetId, String message) {
		BaseResult result = new BaseResult();
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
				DBConnectionResource dbResult = DbcpUtil.executeQuery("select LAST_INSERT_ID()");
				if (dbResult != null) {
					ResultSet rs = dbResult.resultSet;
					String id;
					if(rs.next()){
						id = rs.getString(1);
						values.put("last_id", id);
					}
					r = DbcpUtil.executeUpdate(StringUtil
							.replaceSequenced(StringUtil.replacePlaceholder(
									UPDATE_MSG_STATUS, values)));
					result.setResult(true);
				} 
			} 
		} catch (Exception e) {
			e.printStackTrace();
			LOG.info("发送消息失败，发送者ID：" + userId + " 接收者ID：" + targetId + " 消息内容："
					+ message);

		}
		return result;
	}

	@Override
	public MessageList getMsg(String userId, String targetId, String type,
			String param) {
		Map<String, String> values = new HashMap<String, String>();
		MessageList result = new MessageList();
		List<Message> list = new ArrayList<Message>();
		String groupId;
		if (userId.compareToIgnoreCase(targetId) > 0) {
			groupId = format(targetId) + format(userId);
		} else {
			groupId = format(userId) + format(targetId);
		}
		values.put("group_id", groupId);
		values.put("lastId", "0");
		try {
			System.out.println(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_NEW_MESSAGE, values)));
			 DBConnectionResource dbResult = DbcpUtil.executeQuery(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_NEW_MESSAGE, values)));
			ResultSet rs = dbResult.resultSet;
			while(rs.next()) {
				Message msg = new Message(rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(msg);
			}
			
			result.setMessageList(list);
			result.setResult(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	private String format(String str) {
		while (str.length() < 10) {
			str = "0" + str;
		}
		return str;
	}
}
