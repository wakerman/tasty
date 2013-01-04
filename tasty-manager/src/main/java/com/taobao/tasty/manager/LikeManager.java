package com.taobao.tasty.manager;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_DEFAULT;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.constant.SqlTemplate;
import com.taobao.tasty.common.model.LikeRecord;
import com.taobao.tasty.common.type.OperType;

import common.toolkit.java.entity.DateFormat;
import common.toolkit.java.entity.db.DBConnectionResource;
import common.toolkit.java.exception.ServiceException;
import common.toolkit.java.util.DateUtil;
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
		if ( !IntegerUtil.isBiggerThan0( feedId ) || !IntegerUtil.isBiggerThan0( userId )) {
			return false;
		}
		LikeRecord likeRecord = new LikeRecord(feedId, userId, DateUtil.getNowTime( DateFormat.DateTime ),DateUtil.getNowTime( DateFormat.DateTime ) );
		if( this.addLikeRecord( likeRecord, OperType.LIKE_ADD ) ){
			return this.updateLikeNum( feedId,"like_num+1" );
		}
		return false;
	}
	
	public boolean cancelLike( int feedId, int userId ) throws ServiceException {
		if ( !IntegerUtil.isBiggerThan0( feedId ) || !IntegerUtil.isBiggerThan0( userId )) {
			return false;
		}
		LikeRecord likeRecord = new LikeRecord(feedId, userId, DateUtil.getNowTime( DateFormat.DateTime ),DateUtil.getNowTime( DateFormat.DateTime ) );
		if( this.addLikeRecord( likeRecord, OperType.LIKE_CANCEL ) ){
			return this.updateLikeNum( feedId,"like_num-1" );
		}
		return false;
	}


	private boolean updateLikeNum( int feedId, String likeNum ) throws ServiceException {
		if ( !IntegerUtil.isBiggerThan0( feedId ) ) {
			return false;
		}
		String updateSql = "";
		try {
			Map<String, String> values = new HashMap<String, String>();
			values.put( "feedId", feedId + "" );
			values.put( "likeNum", likeNum );
			updateSql = StringUtil.replacePlaceholder( SqlTemplate.LIKE_UPDATE_NUM_OF_FEED, values );
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
	private boolean addLikeRecord( LikeRecord likeRecord, OperType operType ) throws ServiceException {
		int feedId = likeRecord.getFeedId();
		int userId = likeRecord.getUserId();
		if ( !IntegerUtil.isBiggerThan0( feedId ) || !IntegerUtil.isBiggerThan0( userId ) ) {
			throw new ServiceException( "Invalid feedId or userId." );
		}
		Map<String, String> values = new HashMap<String, String>();
		values.put( "feedId", feedId + "" );
		values.put( "userId", userId + "" );
		values.put( "gmtCreate", likeRecord.getGmtCreate() );
		values.put( "gmtModified", likeRecord.getGmtModified() );
		String sql = "";
		int num = 0;
		try{
			switch ( operType ) {
			case LIKE_ADD:
				sql = StringUtil.replacePlaceholder( SqlTemplate.LIKE_ADD_RECORD, values );
				num = DbcpUtil.executeInsert( sql );
				break;
			case LIKE_CANCEL:
				sql = StringUtil.replacePlaceholder( SqlTemplate.LIKE_DEL_RECORD, values );
				num = DbcpUtil.executeDelete( sql );
				break;
			default:
				break;
			}
		}catch ( Throwable e ) {
			throw new ServiceException( "Error when insert into db, sql: " + sql + ", error: " + e.getMessage(),
					e.getCause() );
		}
			if ( 0 == num ) {
				return false;
			}else{
				return true;
			}
	}
	
	/**
	 * 判断用户是否喜欢Feed
	 */
	public boolean isLike( int feedId, int userId ) throws Exception {

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

	/**
	 * 查看一个Feed喜欢的所有用户
	 * 
	 * @param feedId
	 * @param pageNum
	 * @return
	 * @throws Exception
	 */
	public List<LikeRecord> queryLikeByFeedId( int feedId, int pageNum ) throws Exception {

		pageNum--;
		if ( pageNum < 0 ) {
			pageNum = 0;
		}
		if ( !IntegerUtil.isBiggerThan0( feedId ) ) {
			throw new ServiceException( "Invalid feedId or userId." );
		}
		List<LikeRecord> likeRecordList = new ArrayList<LikeRecord>();
		Map<String, String> values = new HashMap<String, String>();
		values.put( "startOffSet", ( pageNum * PAGE_SIZE_DEFAULT ) + "" );
		values.put( "feedId", feedId + "" );

		ResultSet rs = null;
		DBConnectionResource myResultSet = null;
		String querySql = StringUtil.replaceSequenced( StringUtil.replacePlaceholder(
				SqlTemplate.LIKE_QUERY_BY_FEED_ID, values ) );
		try {
			myResultSet = DbcpUtil.executeQuery( querySql );
			if ( null == myResultSet ) {
				return null;
			}
			rs = myResultSet.resultSet;
			if ( null == rs ) {
				return null;
			}
			while ( rs.next() ) {
				LikeRecord likeRecord = convertResultSetToLikeRecord( rs );
				likeRecordList.add( likeRecord );
			}
			return likeRecordList;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when exec sql: "+ querySql +", Error: " + e.getMessage(), e );
		} finally {
			if ( null != myResultSet ) {
				DbcpUtil.closeResultSetAndStatement( rs, myResultSet.statement );
				DbcpUtil.returnBackConnectionToPool( myResultSet.connection );
			}
		}
	}

	private LikeRecord convertResultSetToLikeRecord( ResultSet rs ) {

		LikeRecord likeRecord = new LikeRecord();
		try {
			likeRecord.setLikeId( rs.getInt( "l.like_id" ) );
			likeRecord.setFeedId( rs.getInt( "l.feed_id" ) );
			likeRecord.setUserId( rs.getInt( "um.user_id" ) );
			likeRecord.setUserName( rs.getString( "um.account" ) );
			likeRecord.setGmtModified( rs.getString( "l.gmt_modified" ) );
		} catch ( SQLException e ) {
			e.printStackTrace();
			LOG.info( "Error when convertResultSetToLikeRecord, error: " + e.getMessage() );
			return null;
		}
		return likeRecord;
	}

}
