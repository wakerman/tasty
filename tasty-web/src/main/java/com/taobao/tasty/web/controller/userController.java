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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.taobao.tasty.common.model.BaseResult;
import com.taobao.tasty.common.user.User;
import com.taobao.tasty.common.user.UserAppend;
import com.taobao.tasty.common.user.UserList;
import com.taobao.tasty.manager.UserManager;
import common.toolkit.java.util.io.ServletUtil;

@Controller
public class userController extends BaseController{
	
	@Autowired
	private UserManager userManager;
	
	private static final Logger LOG = LoggerFactory.getLogger( MessageController.class );
	
	@RequestMapping( value = "/user/add" ,method=RequestMethod.GET )
	public void syncUser(HttpServletRequest request, HttpServletResponse response,

			@RequestParam(value = "account", required = false) String account,
			@RequestParam(value = "accountType", required = false) int accountType,
			@RequestParam(value = "tags", required = false) String tags,
			@RequestParam(value = "resentLocation", required = false) String resentLocation,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "summary", required = false) String summary,
			@RequestParam(value = "birthday", required = false) String birthday,
			@RequestParam(value = "email", required = false) String email
			
			){
		
		User user = new User();
		UserAppend append = new UserAppend();
		
		user.setAccount(account);
		user.setAccountType(accountType);
		user.setTags(tags);
		user.setResentLocation(resentLocation);
		
		append.setAddress(address);
		append.setGender(gender);
		append.setBirthday(birthday);
		append.setEmail(email);
		append.setSummary(summary);
		
		Gson gson = new Gson(); 
		Type type = new TypeToken< BaseResult >() {}.getType();
		BaseResult result = userManager.syncUserInfo(user, append);
		ServletUtil.writeToResponse( response, gson.toJson( result, type) );		
		
	}
	
	@RequestMapping( value = "/user/nearBy" ,method=RequestMethod.GET )
	public void getUserNearBy(HttpServletRequest request, HttpServletResponse response,
			@RequestParam( value = "location", required = false ) String location){
		
		User user = new User();
		
		user.setResentLocation(location);
		
		UserList result = userManager.getUserNearby(user);

		Gson gson = new Gson(); 
		Type type = new TypeToken< UserList >() {}.getType();

		ServletUtil.writeToResponse( response, gson.toJson( result, type) );		
		
	}
}
