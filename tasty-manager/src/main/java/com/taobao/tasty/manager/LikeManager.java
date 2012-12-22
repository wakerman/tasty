package com.taobao.tasty.manager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.constant.SqlTemplate;
import com.taobao.tasty.common.model.Comment;
import com.taobao.tasty.common.model.LikeRecord;
import common.toolkit.java.entity.db.DBConnectionResource;
import common.toolkit.java.exception.ServiceException;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.db.DbcpUtil;
import common.toolkit.java.util.number.IntegerUtil;

/**
 * 喜欢相关接口
 * 
 * @author nileader/nileader@gmail.com
 * @date 2012-12-22
 */
public class LikeManager {

	private static final Logger LOG = Logger.getLogger( LikeManager.class );

	public boolean addLike( int feedId, int userId ) throws ServiceException {
		if ( !IntegerUtil.isBiggerThan0( feedId ) ) {
			return false;
		}
		String updateSql = "";
		try {

			Map<String, String> values = new HashMap<String, String>();
			values.put( "feedId", feedId + "" );

			updateSql = StringUtil.replacePlaceholder( SqlTemplate.LIKE_ADD_NUM_OF_FEED, values );
			int num = DbcpUtil.executeUpdate( updateSql );
			if ( 1 == num ) {
				return true;
			}
			return false;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when exec sql: " + updateSql + ", error: " + e.getMessage(),
					e.getCause() );
		}
	}

	/**
	 * 取消喜欢
	 * 
	 * @param feedId
	 * @param userId
	 * @return
	 * @throws ServiceException
	 */
	public boolean cancelLike( int feedId, int userId ) throws ServiceException {
		if ( !IntegerUtil.isBiggerThan0( feedId ) ) {
			return false;
		}
		String updateSql = "";
		try {

			Map<String, String> values = new HashMap<String, String>();
			values.put( "feedId", feedId + "" );

			updateSql = StringUtil.replacePlaceholder( SqlTemplate.LIKE_CANCEL_NUM_OF_FEED, values );
			int num = DbcpUtil.executeUpdate( updateSql );
			if ( 1 == num ) {
				return true;
			}
			return false;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when exec sql: " + updateSql + ", error: " + e.getMessage(),
					e.getCause() );
		}
	}

	/**
	 * 判断用户是否喜欢Feed
	 * 
	 * @param likeRecord
	 * @return
	 * @throws ServiceException
	 */
	private boolean addLikeRecord( LikeRecord likeRecord ) throws ServiceException {
		int feedId = likeRecord.getFeedId();
		int userId = likeRecord.getUserId();
		if ( !IntegerUtil.isBiggerThan0( feedId ) || !IntegerUtil.isBiggerThan0( userId ) ) {
			throw new ServiceException( "Invalid feedId or userId." );
		}
		String insertSql = "";
		try {
			Map<String, String> values = new HashMap<String, String>();
			values.put( "feedId", feedId + "" );
			values.put( "userId", userId + "" );
			values.put( "gmtCreate", likeRecord.getGmtCreate() );
			values.put( "gmtModified", likeRecord.getGmtModified() );

			insertSql = StringUtil.replacePlaceholder( SqlTemplate.LIKE_ADD_RECORD, values );
			int num = DbcpUtil.executeInsert( insertSql );
			if ( 1 == num ) {
				return true;
			}
			return false;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when insert into db, sql: " + insertSql + ", error: " + e.getMessage(),
					e.getCause() );
		}
	}

	public boolean isLike( int userId, int feedId ) throws Exception {

		Map<String, String> values = new HashMap<String, String>();
		values.put( "feedId", feedId + "" );
		values.put( "userId", userId + "" );

		ResultSet rs = null;
		DBConnectionResource myResultSet = null;
		String querySql = StringUtil.replaceSequenced( StringUtil.replacePlaceholder(
				SqlTemplate.LIKE_CHECK_USER_IS_LIKE, values ) );
		try {
			myResultSet = DbcpUtil.executeQuery( querySql );
			rs = myResultSet.resultSet;
			if ( null != rs && rs.next() ) {
				return true;
			}
			return false;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when exec sql:" + querySql + ", Error: " + e.getMessage(), e );
		} finally {
			if ( null != myResultSet ) {
				DbcpUtil.closeResultSetAndStatement( rs, myResultSet.statement );
				DbcpUtil.returnBackConnectionToPool( myResultSet.connection );
			}
		}
	}

	private Comment convertResultSetToComment( ResultSet rs ) {

		Comment comment = new Comment();
		try {
			comment.setCommentId( rs.getInt( "c.comment_id" ) );
			comment.setFeedId( rs.getInt( "c.feed_id" ) );
			comment.setUserId( rs.getInt( "c.user_id" ) );
			comment.setTargetUserId( rs.getInt( "c.target_user_id" ) );
			comment.setTargetUserName( rs.getString( "c.target_user_name" ) );
			comment.setUserName( rs.getString( "um.user_name" ) );
			comment.setUserIcon( "/user/icon/" + comment.getUserId() );
			comment.setCommentContent( rs.getString( "c.comment_content" ) );
			comment.setGmtModified( rs.getString( "gmt_modified" ) );
		} catch ( SQLException e ) {
			e.printStackTrace();
			LOG.info( "Error when convertResultSetToFeed, error: " + e.getMessage() );
			return null;
		}
		return comment;
	}

}
