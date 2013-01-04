package com.taobao.tasty.web.controller;

import java.lang.reflect.Type;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.taobao.tasty.common.model.BaseResult;
import com.taobao.tasty.common.user.User;
import com.taobao.tasty.common.user.UserAppend;
import com.taobao.tasty.manager.UserManager;
import common.toolkit.java.util.io.ServletUtil;

@Controller
public class userController extends BaseController{
	
	@Autowired
	private UserManager userManager;
	
	private static final Logger LOG = LoggerFactory.getLogger( MessageController.class );
	
	@RequestMapping( value = "/user/add" ,method=RequestMethod.GET )
	public void syncUser(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute(value="user") User user,
			@ModelAttribute(value="userAppend") UserAppend append){
		
		System.out.println(user.getResentLocation());
		System.out.println(user.getAccount());
		Gson gson = new Gson(); 
		Type type = new TypeToken< BaseResult >() {}.getType();
		//BaseResult result = userManager.syncUserInfo(user, append);
		//ServletUtil.writeToResponse( response, gson.toJson( result, type) );		
		
	}
}
