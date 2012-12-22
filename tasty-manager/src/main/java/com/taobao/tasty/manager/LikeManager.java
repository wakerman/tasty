package com.taobao.tasty.manager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.taobao.tasty.common.constant.SqlTemplate;
import com.taobao.tasty.common.model.Comment;
import common.toolkit.java.exception.ServiceException;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.db.DbcpUtil;
import common.toolkit.java.util.number.IntegerUtil;
/**
 * 喜欢相关接口
 * @author nileader/nileader@gmail.com
 * @date 2012-12-22
 */
public class LikeManager {

	private static final Logger LOG = Logger.getLogger( LikeManager.class );
	
	public boolean addLikeNumOfFeed( int feedId ) throws ServiceException {
		if( !IntegerUtil.isBiggerThan0( feedId ) ){
			return false;
		}
		String updateSql = "";
		try {
			
			Map<String, String> values = new HashMap<String, String>();
			values.put( "feedId", feedId+"" );

			updateSql = StringUtil.replacePlaceholder( SqlTemplate.ADD_LIKE_NUM_OF_FEED, values );
			int num = DbcpUtil.executeUpdate( updateSql );
			if ( 1 == num ) {
				return true;
			}
			return false;
		} catch ( Throwable e ) {
			throw new ServiceException( "Error when exec sql: " + updateSql + ", error: " + e.getMessage(), e.getCause() );
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

