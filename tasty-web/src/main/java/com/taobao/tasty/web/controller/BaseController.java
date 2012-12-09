package com.taobao.tasty.web.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.taobao.tasty.manager.CommentManager;
import com.taobao.tasty.manager.FeedManager;

/**
 * Description: Base Controller
 * @author yinshi.nc
 * @Date 2011-11-11
 */
public class BaseController {

	@Autowired
	protected FeedManager feedManager;
	
	@Autowired
	protected CommentManager commentManager;
	
}
