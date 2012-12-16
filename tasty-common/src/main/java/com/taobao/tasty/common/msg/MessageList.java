package com.taobao.tasty.common.msg;

import java.util.List;

public class MessageList extends BaseResult {
	private List<Message> messageList;

	public List<Message> getMessageList(){
		return this.messageList;
	}
	
	public MessageList setMessageList(List<Message> list) {
		this.messageList = list;
		return this;
	}
}
