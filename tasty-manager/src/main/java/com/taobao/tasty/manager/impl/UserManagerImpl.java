package com.taobao.tasty.manager.impl;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.model.BaseResult;
import com.taobao.tasty.common.user.User;
import com.taobao.tasty.common.user.UserList;
import com.taobao.tasty.manager.UserManager;

import common.toolkit.java.entity.db.DBConnectionResource;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.db.DbcpUtil;

public class UserManagerImpl implements UserManager {

	private static final Logger LOG = Logger.getLogger(UserManagerImpl.class);

	private static final String INSERT_USER = "insert into user_model (account, account_type, nick, tags, count, resent_location, icon, gmt_create, gmt_modify, gender, address, summary, birthday, email) values ('${account}', ${account_type}, '${nick}', '${tags}', 0, ${resent_location}, '${icon}', NOW(), NOW(), '${gender}', '${address}', '${summary}', '${birthday}', '${email}')";

	private static final String QUERY_USER_INFO ="select "
			+ "user_id, account,account_type,"
			+ " nick, tags, count,"
			+ "AsText(resent_location) as location,"
			+ "icon, gmt_create, gmt_modify,"
			+ "gender, address, summary, birthday, email "
			+ "from user_model where user_id=${user_id}";
	
	private static final String QUERY_USER_EXIST = "select "
			+ "user_id, account,account_type,"
			+ " nick, tags, count,"
			+ "AsText(resent_location) as location,"
			+ "icon, gmt_create, gmt_modify,"
			+ "gender, address, summary, birthday, email"
			+ " from user_model where account='${account}' and account_type=${account_type}";
	
	private static final String QUERY_USER_NEARBY = "select "
			+ "user_id, account, account_type, nick, tags, count, "
			+ "AsText(resent_location) as location,"
			+ "icon, gmt_create,gmt_modify,"
			+ "gender, address, summary, birthday, email"
			+ " from user_model where  MBRContains(GeomFromText('Polygon(${polygon})'), resent_location) = 1";

	@Override
	public BaseResult confirmUser(String account, int account_type) {
		
		BaseResult result = new BaseResult();
		DBConnectionResource dbResult = null;
		ResultSet rs = null;

		Map<String, String> values = new HashMap<String, String>();
		
		values.put("account", account);
		values.put("account_type", String.valueOf(account_type));
		try {
			dbResult = DbcpUtil.executeQuery(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_USER_EXIST, values)));
			
			rs = dbResult.resultSet;
			if (rs.next()) {
				result.setResult(true);
				result.setState(BaseResult.STATE_OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				DbcpUtil.closeResultSetAndStatement(rs, dbResult.statement);
				DbcpUtil.returnBackConnectionToPool(dbResult.connection);
			}
		}
		return result;
	}
	
	@Override
	public BaseResult syncUserInfo(User user) {

		BaseResult result = new BaseResult();

		Map<String, String> values = new HashMap<String, String>();
		values.put("account", user.getAccount());
		values.put("account_type", String.valueOf(user.getAccountType()));
		values.put("nick", user.getNick());
		values.put("icon", user.getIcon());
		values.put("tags", user.getTags());
		values.put("resent_location", locationToPoint(user.getResentLocation()));
		values.put("gender", user.getGender());
		values.put("address", user.getAddress());
		values.put("birthday", user.getBirthday());
		values.put("summary", user.getSummary());
		values.put("email", user.getEmail());
		
		try {
			int r = DbcpUtil.executeInsert(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							INSERT_USER, values)));
			if (1 == r) {
				result.setResult(true);
				result.setState(BaseResult.STATE_OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return result;
	}

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
				u.setNick(rs.getString("nick"));
				u.setTags(rs.getString("tags"));
				u.setCount(rs.getInt("count"));
				u.setResentLocation(pointToLocation(rs.getString("location")));
				u.setIcon(rs.getString("icon"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSummary(rs.getString("summary"));
				u.setBirthday(rs.getString("birthday"));
				u.setEmail(rs.getString("email"));
				list.add(u);
			}
			
			result.setList(list);
			result.setState(BaseResult.STATE_OK);
			result.setResult(true);
			
		} catch (Exception e) {
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
	
	private String pointToLocation(String point) {
		String location = point.substring(6, point.length() - 1);
		location = location.replace(' ', ',');
		return location;
	}

	@Override
	public User getUser(long userId) {
		User u = null;
		DBConnectionResource dbResult = null;
		ResultSet rs = null;
		Map<String, String> values = new HashMap<String, String>();
		
		values.put("user_id", String.valueOf(userId));
		
		try {
			dbResult = DbcpUtil.executeQuery(StringUtil
					.replaceSequenced(StringUtil.replacePlaceholder(
							QUERY_USER_INFO, values)));
			rs = dbResult.resultSet;
			if(rs.next()) {
				u = new User();
				u.setId(rs.getInt("user_id"));
				u.setAccount(rs.getString("account"));
				u.setAccountType(rs.getInt("account_type"));
				u.setNick(rs.getString("nick"));
				u.setTags(rs.getString("tags"));
				u.setCount(rs.getInt("count"));
				u.setResentLocation(pointToLocation(rs.getString("location")));
				u.setIcon(rs.getString("icon"));
				u.setGender(rs.getString("gender"));
				u.setAddress(rs.getString("address"));
				u.setSummary(rs.getString("summary"));
				u.setBirthday(rs.getString("birthday"));
				u.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				DbcpUtil.closeResultSetAndStatement(rs, dbResult.statement);
				DbcpUtil.returnBackConnectionToPool(dbResult.connection);
			}
		}
		
		return u;
	}
}
