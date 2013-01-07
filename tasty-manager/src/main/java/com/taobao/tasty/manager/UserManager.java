package com.taobao.tasty.manager;

import com.taobao.tasty.common.model.BaseResult;
import com.taobao.tasty.common.user.User;
import com.taobao.tasty.common.user.UserList;

public interface UserManager {
	public BaseResult syncUserInfo(User user);
	
	public UserList getUserNearby(User user);

	public BaseResult confirmUser(String account, int account_type);
	
	public User getUser(long userId);
}
