package com.taobao.tasty.manager.impl;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.model.BaseResult;
import com.taobao.tasty.common.user.User;
import com.taobao.tasty.common.user.UserAppend;
import com.taobao.tasty.common.user.UserList;
import com.taobao.tasty.manager.UserManager;

import common.toolkit.java.entity.db.DBConnectionResource;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.db.DbcpUtil;

public class UserManagerImpl implements UserManager {

	private static final Logger LOG = Logger.getLogger(UserManagerImpl.class);

	private static final String INSERT_USER = "insert into user_model (account, account_type, tags, last_id, count, resent_words, resent_location, gmt_create, gmt_modify) values ('${account}', ${account_type}, '${tags}', 0, 0, '', ${resent_location}, NOW(), NOW()";

	private static final String INSERT_USER_APPEND = "insert into user_append (user_id, gender, adddress, summary, birthday, email, gmt_create, gmt_modify) values (${user_id}, '${gender}', '${address}', '${summary}', '${birthday}', '${email}', NOW(), NOW())";

	@Override
	public BaseResult syncUserInfo(User user, UserAppend userAppend) {

		DBConnectionResource dbResult = null;
		ResultSet rs = null;
		BaseResult result = new BaseResult();
		
		Map<String, String> values = new HashMap<String, String>();
		values.put("account", user.getAccount());
		values.put("account_type", String.valueOf(user.getAccountType()));
		values.put("tags", user.getTags());
		values.put("resent_location", locationToPoint(user.getResentLocation()));
		try {
			int r = DbcpUtil.executeInsert(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							INSERT_USER, values)));
			if (1 == r) {
				dbResult = DbcpUtil
						.executeQuery("select LAST_INSERT_ID()");
				if (dbResult != null) {
					rs = dbResult.resultSet;
					String id;
					if (rs.next()) {
						id = rs.getString(1);
						values.put("user_id", id);
						values.put("gender", userAppend.getGender());
						values.put("address", userAppend.getAddress());
						values.put("birthday", userAppend.getBirthday());
						values.put("email", userAppend.getEmail());
						
						r = DbcpUtil.executeInsert(StringUtil
								.replaceSequenced(StringUtil.replacePlaceholder(
										INSERT_USER_APPEND, values)));
						if (1 == r) {
							result.setState(BaseResult.STATE_OK);
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if ( null != rs ) {
				DbcpUtil.closeResultSetAndStatement( rs, dbResult.statement );
				DbcpUtil.returnBackConnectionToPool( dbResult.connection );
			}
		}

		return result;
	}

	@Override
	public UserList getUserNearby() {
		// TODO Auto-generated method stub
		return null;
	}

	private String locationToPoint(String location) {
		String point = location.replace(',', ' ');
		point = "PointFromText(POINT(" + point + "))";
		return point;
	}

}
