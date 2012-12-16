package com.taobao.tasty.manager;

import com.taobao.tasty.common.msg.BaseResult;
import com.taobao.tasty.common.msg.MessageList;



public interface MsgManager {
	public BaseResult sendMsg(String userId, String targetId, String message);

	public MessageList getMsg(String userId, String targetId, String type, String param);

}