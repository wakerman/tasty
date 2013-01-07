package com.taobao.tasty.common.user;

import java.util.Date;

/**
 * @author nileader/nileader@gmail.com
 */
public class User {

	private int id;
	private String 	userIcon;
	private String account;
	private int accountType;
	private String tags;
	private int lastId;
	private int count;
	private String resentWords;
	private String resentLocation;
	private Date gmtCreate;
	private Date gmtModfy;
	private String nick;
	private String icon;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getAccountType() {
		return accountType;
	}
	public void setAccountType(int accountType) {
		this.accountType = accountType;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public int getLastId() {
		return lastId;
	}
	public void setLastId(int lastId) {
		this.lastId = lastId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getResentWords() {
		return resentWords;
	}
	public void setResentWords(String resentWords) {
		this.resentWords = resentWords;
	}
	public String getResentLocation() {
		return resentLocation;
	}
	public void setResentLocation(String resentLocation) {
		this.resentLocation = resentLocation;
	}
	public Date getGmtCreate() {
		return gmtCreate;
	}
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	public Date getGmtModfy() {
		return gmtModfy;
	}
	public void setGmtModfy(Date gmtModfy) {
		this.gmtModfy = gmtModfy;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
}
