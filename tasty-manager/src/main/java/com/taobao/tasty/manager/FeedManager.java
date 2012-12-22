package com.taobao.tasty.manager;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_FEED;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.constant.SqlTemplate;
import com.taobao.tasty.common.model.Feed;
import common.toolkit.java.entity.db.DBConnectionResource;
import common.toolkit.java.exception.ServiceException;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.db.DbcpUtil;

/**
 * Tlog数据源管理
 * 
 * @author nileader nileader@gmail.com
 * @date Sep 17, 2012
 */
public class FeedManager {

	private static final Logger LOG = Logger.getLogger( FeedManager.class );

	public List<Feed> queryLasted( int pageNum ) throws Exception {
		
		pageNum--;
		if( pageNum < 0 ){
			pageNum = 0;
		}
		List<Feed> feedList = new ArrayList<Feed>();
		Map<String,String> values = new HashMap<String, String>();
		values.put( "startOffSet", (pageNum* PAGE_SIZE_OF_FEED )+"" );
		
		ResultSet rs = null;
		DBConnectionResource myResultSet = null;
		try {
			myResultSet = DbcpUtil.executeQuery( StringUtil.replaceSequenced( StringUtil.replacePlaceholder( SqlTemplate.QUERY_MESSAGE_LASTED, values ) ) );
			if ( null == myResultSet ) {
				return null;
			}
			rs = myResultSet.resultSet;
			if ( null == rs ) {
				return null;
			}
			while ( rs.next() ) {
				Feed feed = convertResultSetToFeed( rs );
				feedList.add( feed );
			}
			return feedList;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when query systemSetting, Error: " + e.getMessage(), e );
		} finally {
			if ( null != myResultSet ) {
				DbcpUtil.closeResultSetAndStatement( rs, myResultSet.statement );
				DbcpUtil.returnBackConnectionToPool( myResultSet.connection );
			}
		}
	}
	
	public List<Feed> queryRecommend( int pageNum ) throws Exception {
		
		pageNum--;
		if( pageNum < 0 ){
			pageNum = 0;
		}
		List<Feed> feedList = new ArrayList<Feed>();
		Map<String,String> values = new HashMap<String, String>();
		values.put( "startOffSet", (pageNum* PAGE_SIZE_OF_FEED )+"" );
		
		ResultSet rs = null;
		DBConnectionResource myResultSet = null;
		try {
			myResultSet = DbcpUtil.executeQuery( StringUtil.replaceSequenced( StringUtil.replacePlaceholder( SqlTemplate.QUERY_MESSAGE_RECOMMEND, values ) ) );
			if ( null == myResultSet ) {
				return null;
			}
			rs = myResultSet.resultSet;
			if ( null == rs ) {
				return null;
			}
			while ( rs.next() ) {
				Feed feed = convertResultSetToFeed( rs );
				feedList.add( feed );
			}
			return feedList;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when query systemSetting, Error: " + e.getMessage(), e );
		} finally {
			if ( null != myResultSet ) {
				DbcpUtil.closeResultSetAndStatement( rs, myResultSet.statement );
				DbcpUtil.returnBackConnectionToPool( myResultSet.connection );
			}
		}
	}
	
	
//	public Feed queryFeedByFeedId( int feedId, ) throws Exception {
//		
//		if()
//		Map<String,String> values = new HashMap<String, String>();
//		values.put( "feedId", feedId + "" );
//		 
//		ResultSet rs = null;
//		DBConnectionResource myResultSet = null;
//		try {
//			myResultSet = DbcpUtil.executeQuery( StringUtil.replaceSequenced( StringUtil.replacePlaceholder( SqlTemplate.QUERY_MESSAGE_RECOMMEND, values ) ) );
//			if ( null == myResultSet ) {
//				return null;
//			}
//			rs = myResultSet.resultSet;
//			if ( null == rs ) {
//				return null;
//			}
//			while ( rs.next() ) {
//				Feed feed = convertResultSetToFeed( rs );
//				feedList.add( feed );
//			}
//			return feedList;
//		} catch ( Throwable e ) {
//			throw new ServiceException( "Error when query systemSetting, Error: " + e.getMessage(), e );
//		} finally {
//			if ( null != myResultSet ) {
//				DbcpUtil.closeResultSetAndStatement( rs, myResultSet.statement );
//				DbcpUtil.returnBackConnectionToPool( myResultSet.connection );
//			}
//		}
//	}
	
	
	
	
	
	
	
	
	
	
	
	

	
	private Feed convertResultSetToFeed( ResultSet rs ) {

		Feed feed = new Feed();
		try {
			feed.setFeedId( rs.getInt( "f.feed_id" ) );
			feed.setUserId( rs.getInt( "f.user_id" ) );
			feed.setUserName( rs.getString( "um.user_name" ) );
			feed.setUserIcon( "/user/icon/" + feed.getUserId() );
			feed.setFoodName( rs.getString( "f.food_name" ) );
			feed.setFeedContent( rs.getString( "f.feed_content" ) );
			feed.setGmtModified( rs.getString( "gmt_modified" ) );
			feed.setLocation( rs.getString( "f.location" ) );
			feed.setLikeNum( rs.getInt( "f.like_num" ) );
			feed.setCommentNum( rs.getInt( "f.comment_num" ) );
			feed.setPic( rs.getString( "f.pic" ) );
			feed.setIsRecommend( rs.getInt( "f.is_recommend" ) );
		} catch ( SQLException e ) {
			e.printStackTrace();
			LOG.info( "Error when convertResultSetToMessage, error: " + e.getMessage() );
			return null;
		}
		return feed;
	}
	

}

