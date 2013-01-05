package com.taobao.tasty.manager;

import com.taobao.tasty.common.model.BaseResult;
import com.taobao.tasty.common.user.User;
import com.taobao.tasty.common.user.UserAppend;
import com.taobao.tasty.common.user.UserList;

public interface UserManager {
	public BaseResult syncUserInfo(User user, UserAppend userAppend);
	
	public UserList getUserNearby(User user);
}
