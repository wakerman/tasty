package com.taobao.tasty.common.model;
/**
 * 喜欢记录
 * @author nileader/nileader@gmail.com
 * @date 2012-12-22
 */
public class LikeRecord {

	private int likeId;
	private int feedId;
	private int userId;
	private String gmtCreate;
	private String gmtModified;
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId( int likeId ) {
		this.likeId = likeId;
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
	
}
