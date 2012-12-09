package com.taobao.tasty.common.model;
/**
 * @author nileader/nileader@gmail.com
 */
public class User {

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
	private int 		userId;
	private String 	userName;
	private String 	userIcon;
}
