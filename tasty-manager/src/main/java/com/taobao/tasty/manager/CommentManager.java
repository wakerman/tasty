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
import com.taobao.tasty.common.model.Comment;
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
public class CommentManager {

	private static final Logger LOG = Logger.getLogger( CommentManager.class );

	public List<Comment> queryLasted( int pageNum, int feedId ) throws Exception {
		
		pageNum--;
		if( pageNum < 0 ){
			pageNum = 0;
		}
		List<Comment> commentList = new ArrayList< Comment >();
		Map<String,String> values = new HashMap<String, String>();
		values.put( "startOffSet", (pageNum* PAGE_SIZE_OF_FEED )+"" );
		values.put( "feed_id", feedId+"" );
		
		ResultSet rs = null;
		DBConnectionResource myResultSet = null;
		try {
			myResultSet = DbcpUtil.executeQuery( StringUtil.replaceSequenced( StringUtil.replacePlaceholder( SqlTemplate.QUERY_COMMENT_LASTED, values ) ) );
			if ( null == myResultSet ) {
				return null;
			}
			rs = myResultSet.resultSet;
			if ( null == rs ) {
				return null;
			}
			while ( rs.next() ) {
				Comment comment = convertResultSetToComment( rs );
				commentList.add( comment );
			}
			return commentList;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when query systemSetting, Error: " + e.getMessage(), e );
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

