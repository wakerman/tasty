package com.taobao.tasty.manager.impl;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.constant.SqlTemplate;
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

	private static final String INSERT_USER = "insert into user_model (account, account_type, tags, last_id, count, resent_words, resent_location, gmt_create, gmt_modify) values ('${account}', ${account_type}, '${tags}', 0, 0, '', ${resent_location}, NOW(), NOW())";

	private static final String INSERT_USER_APPEND = "insert into user_append (user_id, gender, address, summary, birthday, email, gmt_create, gmt_modify) values (${user_id}, '${gender}', '${address}', '${summary}', '${birthday}', '${email}', NOW(), NOW())";

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
				dbResult = DbcpUtil.executeQuery("select LAST_INSERT_ID()");
				if (dbResult != null) {
					rs = dbResult.resultSet;
					String id;
					if (rs.next()) {
						id = rs.getString(1);
						values.put("user_id", id);
						values.put("gender", userAppend.getGender());
						values.put("address", userAppend.getAddress());
						values.put("birthday", userAppend.getBirthday());
						values.put("summary", userAppend.getSummary());
						values.put("email", userAppend.getEmail());

						r = DbcpUtil.executeInsert(StringUtil
								.replaceSequenced(StringUtil
										.replacePlaceholder(INSERT_USER_APPEND,
												values)));
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
			if (null != rs) {
				DbcpUtil.closeResultSetAndStatement(rs, dbResult.statement);
				DbcpUtil.returnBackConnectionToPool(dbResult.connection);
			}
		}

		return result;
	}

	private static final String QUERY_USER_NEARBY = "select "
			+ "user_id, account, account_type, tags, last_id, count, resent_words, "
			+ "AsText(resent_location) as location,"
			+ "gmt_create,gmt_modify"
			+ " from user_model where  MBRContains(GeomFromText('Polygon(${polygon})'), resent_location) = 1";

	/**
	 * location 的格式是 xxx,xxx
	 */
	@Override
	public UserList getUserNearby(User user) {
		UserList result = new UserList();
		List<User> list = new ArrayList<User>();
		DBConnectionResource dbResult = null;
		ResultSet rs = null;

		String[] loc = user.getResentLocation().split(",");
		BigDecimal x = new BigDecimal(loc[0]);
		BigDecimal y = new BigDecimal(loc[1]);

		BigDecimal x1 = x.add(new BigDecimal(0.01));
		BigDecimal x2 = x.subtract(new BigDecimal(0.01));

		BigDecimal y1 = y.add(new BigDecimal(0.01));
		BigDecimal y2 = y.subtract(new BigDecimal(0.01));

		String range = "(" 
				+ x1.doubleValue() + " " + y1.doubleValue() + ","
				+ x1.doubleValue() + " " + y2.doubleValue() + ","
				+ x2.doubleValue() + " " + y2.doubleValue() + ","
				+ x2.doubleValue() + " " + y1.doubleValue() + ","
				+ x1.doubleValue() + " " + y1.doubleValue() + ")";

		Map<String, String> values = new HashMap<String, String>();

		values.put("polygon", range);

		try {
			dbResult = DbcpUtil.executeQuery(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_USER_NEARBY, values)));

			rs = dbResult.resultSet;
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("user_id"));
				u.setAccount(rs.getString("account"));
				u.setAccountType(rs.getInt("account_type"));
				u.setTags(rs.getString("tags"));
				u.setCount(rs.getInt("count"));
				u.setResentLocation(rs.getString("resent_words"));
				u.setResentLocation(rs.getString("location"));
				list.add(u);
			}
			
			result.setList(list);
			result.setState(BaseResult.STATE_OK);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (null != rs) {
				DbcpUtil.closeResultSetAndStatement(rs, dbResult.statement);
				DbcpUtil.returnBackConnectionToPool(dbResult.connection);
			}
		}

		return result;
	}

	private String locationToPoint(String location) {
		String point = location.replace(',', ' ');
		point = "PointFromText('POINT(" + point + ")')";
		return point;
	}
}
