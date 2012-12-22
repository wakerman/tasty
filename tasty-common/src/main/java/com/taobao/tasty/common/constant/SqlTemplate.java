package com.taobao.tasty.common.constant;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_COMMENT;
import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_FEED;
/**
 * Sql template
 * @author  nileader / nileader@gmail.com
 * @Date	 2012-12-1
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
	
	/** 查询最新的Feed */
	public static final String QUERY_FEED_BY_FEED_ID					= "SELECT f.feed_id," +
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
																										"WHERE f.feed_id=${feedId} AND f.user_id = um.user_id ";
	
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
																													"c.target_user_id, " +
																													"c.target_user_name, " +
																													"um.user_name," +
																													"c.comment_content," +
																													"c.gmt_modified " +
																										"FROM comment c,user_model um " + // 
																										"WHERE c.user_id = um.user_id AND c.feed_id=${feed_id} " + //
																										"ORDER BY c.gmt_modified DESC " + // 
																										"LIMIT ${startOffSet}," + PAGE_SIZE_OF_COMMENT;
	
	/** 添加评论 */
	public static final String ADD_COMMENT_LASTED 				= "INSERT INTO comment " +
																													"(feed_id, user_id, target_user_id, target_user_name, comment_content, gmt_create, gmt_modified) " +
																													"VALUES " +
																													"(${feedId},${userId},${target_user_id}, '${target_user_name}', '${commentContent}','${gmtCreate}','${gmtModified}')";
	//===============以下 喜欢 相关==========================
	/** 对一个feed添加一次喜欢次数 */
	public static final String LIKE_ADD_NUM_OF_FEED				= "UPDATE feed SET like_num = like_num + 1 WHERE feed_id=${feedId}";
	/** 对一个feed减去一次喜欢次数 */
	public static final String LIKE_CANCEL_NUM_OF_FEED			= "UPDATE feed SET like_num = like_num - 1 WHERE feed_id=${feedId}";
	/** 添加喜欢记录 */
	public static final String LIKE_ADD_RECORD 							= "INSERT INTO like_cecord " +
																													"(feed_id, user_id, gmt_create, gmt_modified) " +
																													"VALUES " +
																													"(${feedId},${userId},'${gmtCreate}','${gmtModified}')";
	/** 取消：删除喜欢记录 */
	public static final String LIKE_DEL_RECORD 							= "DELETE FROM like_record WHERE feed_id=${feedId} AND user_id=${userId}";
	/** 判断用户是否喜欢某个feed */
	public static final String LIKE_CHECK_USER_IS_LIKE				= "SELECT * FROM like_record WHERE feed_id=${feedId} AND user_id=${userId} ";
	
	
	
	
	
	
	
}
