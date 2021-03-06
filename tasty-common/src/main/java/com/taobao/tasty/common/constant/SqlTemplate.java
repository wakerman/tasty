package com.taobao.tasty.common.constant;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_COMMENT;
import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_FEED;
import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_DEFAULT;
/**
 * Sql template
 * @author  nileader / nileader@gmail.com
 * @Date	 2012-12-1
 */
public class SqlTemplate {

	/** 查询最新的Feed */
	public static final String QUERY_MESSAGE_LASTED 				= "SELECT f.feed_id," +
																													"f.user_id," +
																													"um.account," +
																													"f.food_name," +
																													"f.feed_content," +
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
																													"um.account," +
																													"f.food_name," +
																													"f.feed_content," +
																													"f.gmt_modified," +
																													"f.location," +
																													"f.like_num," +
																													"f.comment_num," +
																													"f.pic," + //
																													"f.is_recommend " + //
																										"FROM feed f,user_model um " + // 
																										"WHERE f.feed_id=${feedId} AND f.user_id = um.user_id ";
	
	/** 查询最新的Feed */
	public static final String INSTER_INTO_FEED						= "INSERT INTO feed (" +
																																	"user_id, " +
																																	"food_name, " +
																																	"feed_content," +
																																	"gmt_create," +
																																	"gmt_modified, " +
																																	"location, " +
																																	"like_num, " +
																																	"comment_num, " +
																																	"pic, " +
																																	"is_recommend ) " +
																																	"VALUES (" +
																																	"${userId}, " +
																																	"'${foodName}', " +
																																	"'${feedContent}', " +
																																	"'${gmtCreate}', " +
																																	"'${gmtModified}', " +
																																	"'${location}', " +
																																	"0, " +
																																	"0, " +
																																	"'${pic}', " +
																																	"0 )";
	
	/** 查询推荐的Feed */
	public static final String QUERY_MESSAGE_RECOMMEND		= "SELECT f.feed_id," +
																													"f.user_id," +
																													"um.account," +
																													"f.food_name," +
																													"f.feed_content," +
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
																													"um.account," +
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
	/** 对一个feed更新喜欢次数 */
	public static final String LIKE_UPDATE_NUM_OF_FEED				= "UPDATE feed SET like_num = ${likeNum} WHERE feed_id=${feedId}";
	
	/** 添加喜欢记录 */
	public static final String LIKE_ADD_RECORD 							= "INSERT INTO like_record " +
																													"(feed_id, user_id, gmt_create, gmt_modified) " +
																													"VALUES " +
																													"(${feedId},${userId},'${gmtCreate}','${gmtModified}')";
	/** 取消：删除喜欢记录 */
	public static final String LIKE_DEL_RECORD 							= "DELETE FROM like_record WHERE feed_id=${feedId} AND user_id=${userId}";
	/** 判断用户是否喜欢某个feed */
	public static final String LIKE_CHECK_USER_IS_LIKE				= "SELECT * FROM like_record WHERE feed_id=${feedId} AND user_id=${userId} ";
	/** 查询最新的喜欢记录 */
	public static final String LIKE_QUERY_BY_FEED_ID				 	= "SELECT l.like_id," +
																													"l.feed_id," +
																													"um.user_id," +
																													"um.account," +
																													"l.gmt_modified " +
																										"FROM like_record l,user_model um " + // 
																										"WHERE l.user_id = um.user_id AND l.feed_id=${feedId} " + //
																										"ORDER BY l.gmt_modified DESC " + // 
																										"LIMIT ${startOffSet},"+PAGE_SIZE_DEFAULT;
	
	
	
	
	
	
}
