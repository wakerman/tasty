package com.taobao.tasty.web.controller;

import java.lang.reflect.Type;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.taobao.tasty.common.msg.BaseResult;
import com.taobao.tasty.common.msg.MessageList;
import com.taobao.tasty.manager.MsgManager;
import common.toolkit.java.util.io.ServletUtil;

@Controller
public class MessageController{
	
	@Autowired
	protected MsgManager msgManager;

	private static final Logger LOG = LoggerFactory.getLogger( MessageController.class );
	
	@RequestMapping( value = "/message/send" ,method=RequestMethod.GET )
	public void sendMsg(HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "userId", required = true ) String userId,//
			@RequestParam( value = "tarId", required = true ) String tarId,//
			@RequestParam( value = "msg", required = false ) String msg ){
		Gson gson = new Gson(); 
		Type type = new TypeToken< BaseResult >() {}.getType();
		BaseResult result = msgManager.sendMsg(userId, tarId, msg);
		ServletUtil.writeToResponse( response, gson.toJson( result, type) );		
	}
	
	@RequestMapping( value = "/message/get" ,method=RequestMethod.GET )
	public void getMsg(HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "userId", required = true ) String userId,//
			@RequestParam( value = "tarId", required = true ) String tarId,//
			@RequestParam( value = "flag", required = true ) int flag ,
			@RequestParam( value = "param", required = false ) String param){
		Gson gson = new Gson(); 
		MessageList result = msgManager.getMsg(userId, tarId, flag, param);
		ServletUtil.writeToResponse( response, gson.toJson(result));		
	}
}
