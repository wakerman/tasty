package com.taobao.tasty.common.model;

/**
 *  Feed实体
 * @author nileader/nileader@gmail.com
 * @date 2012-12-22
 */
public class Feed {
	
	public Feed(){};
	public Feed( long userId, String foodName, String feedContent, String location, String pic, String gmtCreate, String gmtModified ){
		this.userId 				= Integer.parseInt( userId+"");
		this.foodName 		= foodName;
		this.feedContent		= feedContent;
		this.location				= location;
		this.pic						= pic;
		this.gmtCreate			= gmtCreate;
		this.gmtModified		= gmtModified;
	}
	

	public int getFeedId() {
		return feedId;
	}
	public void setFeedId( int feedId ) {
		this.feedId = feedId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId( int userId ) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName( String userName ) {
		this.userName = userName;
	}
	public String getGmtCreate() {
		return gmtCreate;
	}
	public void setGmtCreate( String gmtCreate ) {
		this.gmtCreate = gmtCreate;
	}
	public String getGmtModified() {
		return gmtModified;
	}
	public void setGmtModified( String gmtModified ) {
		this.gmtModified = gmtModified;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation( String location ) {
		this.location = location;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum( int likeNum ) {
		this.likeNum = likeNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName( String foodName ) {
		this.foodName = foodName;
	}
	public String getFeedContent() {
		return feedContent;
	}
	public void setFeedContent( String feedContent ) {
		this.feedContent = feedContent;
	}
	public void setCommentNum( int commentNum ) {
		this.commentNum = commentNum;
	}
	public String getPic() {
		return pic;
	}
	public void setPic( String pic ) {
		this.pic = pic;
	}
	public int getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend( int isRecommend ) {
		this.isRecommend = isRecommend;
	}
	
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon( String userIcon ) {
		this.userIcon = userIcon;
	}

	private int feedId;
	private int userId;
	private String userName;
	private String userIcon;
	private String foodName;
	private String feedContent;
	private String gmtCreate;
	private String gmtModified;
	private String location;
	private int likeNum;
	private int commentNum;
	private String pic;
	private int isRecommend;
	
	
	
}
