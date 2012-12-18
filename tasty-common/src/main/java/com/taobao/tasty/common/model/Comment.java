package com.taobao.tasty.common.model;

/**
 * 评论实体
 * @author nileader/nileader@gmail.com
 */
public class Comment {

	private int 		commentId;
	private int 		feedId;
	private int 		userId;
	private String 	userName;
	private long 	targetUserId;
	private String	targetUserName;
	private String 	userIcon;
	private String 	commentContent;
	private String 	gmtCreate;
	private String 	gmtModified;
	
	public Comment(){
		
	}
	public Comment( int feedId, int userId, int targetUserId, String targetUserName, String commentContent, String gmtCreate, String gmtModified ){
		this.feedId					= feedId;
		this.userId					= userId;
		this.targetUserId			= targetUserId;
		this.targetUserName	= targetUserName;
		this.commentContent	= commentContent;
		this.gmtCreate 				= gmtCreate;
		this.gmtModified			= gmtModified;
	}
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId( int commentId ) {
		this.commentId = commentId;
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
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon( String userIcon ) {
		this.userIcon = userIcon;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent( String commentContent ) {
		this.commentContent = commentContent;
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
	public long getTargetUserId() {
		return targetUserId;
	}
	public void setTargetUserId( long targetUserId ) {
		this.targetUserId = targetUserId;
	}
	public String getTargetUserName() {
		return targetUserName;
	}
	public void setTargetUserName( String targetUserName ) {
		this.targetUserName = targetUserName;
	}
}
