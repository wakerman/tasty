package com.taobao.tasty.manager.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.taobao.tasty.common.model.BaseResult;
import com.taobao.tasty.common.msg.Message;
import com.taobao.tasty.common.msg.MessageList;

public class DataSimulator {
	static DataSimulator sim = null;
	private Map<String,List<Message>> db = new HashMap<String, List<Message>>();
	
	
	private DataSimulator(){
		
	}
	
	public static DataSimulator getInstance() {
		
		if (null == sim) {
			sim = new DataSimulator();
		}
		
		return sim;
	}
	
	public MessageList getMsg(String userId, Integer count) {
		
		
		// TODO Auto-generated method stub
		List<Message> list = db.get(userId);
		MessageList result = new MessageList(); 
		result.setMessageList(list).setResult(true);
		list = new ArrayList<Message>();
		db.put(userId, list);
		return result;
	}

	public BaseResult refreshLastModify() {
		BaseResult rs = new BaseResult();
		rs.setResult(true);
		return rs;
	}

	public BaseResult sendMsg(String fromUserId, String toUserId, Object message) {
		BaseResult rs = new BaseResult();
		Message msg = new Message(fromUserId, toUserId, message);
		List<Message> mList = db.get(toUserId);
		if (null == mList) {
			mList = new ArrayList<Message>();
		}
		mList.add(msg);
		db.put(toUserId, mList);
		rs.setResult(true);
		return rs;
	}
}
