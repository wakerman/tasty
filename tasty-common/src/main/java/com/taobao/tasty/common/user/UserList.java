package com.taobao.tasty.common.user;

import java.util.List;

import com.taobao.tasty.common.model.BaseResult;

public class UserList extends BaseResult{
	private List<User> list;

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}
	
}
