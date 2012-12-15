package com.taobao.tasty.common.constant;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_COMMENT;
import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_FEED;
/**
 * Sql template
 * @author  nileader / nileader@gmail.com
 * @Date	 2012-3-1
 */
public class SqlTemplate {

	/** 查询最新的Feed */
	public static final String QUERY_MESSAGE_LASTED 				= "SELECT f.feed_id," +
																													"f.user_id," +
																													"um.user_name," +
																													"f.message_content," +
																													"f.gmt_modified," +
																													"f.location," +
																													"f.like_num," +
																													"f.comment_num," +
																													"f.pic," + //
																													"f.is_recommend " + //
																										"FROM feed f,user_model um " + // 
																										"WHERE f.user_id = um.user_id " + //
																										"ORDER BY f.gmt_modified DESC " + // 
																										"LIMIT ${startOffSet},"+PAGE_SIZE_OF_FEED;
	/** 查询推荐的Feed */
	public static final String QUERY_MESSAGE_RECOMMEND		= "SELECT f.feed_id," +
																													"f.user_id," +
																													"um.user_name," +
																													"f.message_content," +
																													"f.gmt_modified," +
																													"f.location," +
																													"f.like_num," +
																													"f.comment_num," +
																													"f.pic," + //
																													"f.is_recommend " + //
																										"FROM feed f,user_model um " + // 
																										"WHERE f.user_id = um.user_id AND f.is_recommend=1 " + //
																										"ORDER BY f.gmt_modified DESC " + // 
																										"LIMIT ${startOffSet},"+PAGE_SIZE_OF_FEED;
	
	/** 查询指定Feed_ID的所有评论 */
	public static final String QUERY_COMMENT_LASTED 			= "SELECT c.comment_id," +
																													"c.feed_id, " +
																													"c.user_id, " +
																													"um.user_name," +
																													"c.comment_content," +
																													"c.gmt_modified " +
																										"FROM comment c,user_model um " + // 
																										"WHERE c.user_id = um.user_id AND c.feed_id=${feed_id} " + //
																										"ORDER BY c.gmt_modified DESC " + // 
																										"LIMIT ${startOffSet}," + PAGE_SIZE_OF_COMMENT;
	
	/** 添加评论 */
	public static final String ADD_COMMENT_LASTED 				= "INSERT INTO comment " +
																													"(feed_id, user_id, comment_content, gmt_create, gmt_modified) " +
																													"VALUES " +
																													"(${feedId},${userId},'${commentContent}','${gmtCreate}','${gmtModified}')";
	
	
}
