package com.taobao.tasty.manager;

import com.taobao.tasty.common.msg.MessageList;



public interface MsgManager {
	public MessageList sendMsg(String userId, String targetId, String message);

	public MessageList getMsg(String userId, String targetId, int type, String param);

}