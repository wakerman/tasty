package com.taobao.tasty.web.controller;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_COMMENT;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.taobao.tasty.common.model.Comment;
import com.taobao.tasty.common.type.PageModel;
import com.taobao.tasty.common.type.PageModelState;

import common.toolkit.java.exception.ServiceException;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.io.ServletUtil;
import common.toolkit.java.util.number.IntegerUtil;

/**
 * Search Controller
 * 
 * @author nileader nileader@gmail.com
 * @date Sep 11, 2012
 */
@Controller
public class CommentController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger( CommentController.class );

	/**
	 * Page of search
	 * 
	 * @param request
	 * @param response
	 * @param message
	 * @return
	 */
	@RequestMapping( value = "/comment/query.html" )
	public void query( HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "message", required = false ) String message,//
			@RequestParam( value = "feedId", required = false ) String feedId,//
			@RequestParam( value = "pageNum", required = false ) String pageNum ) {

		int pageNumInt = IntegerUtil.defaultIfError( pageNum, 1 );
		Type listType = new TypeToken<PageModel<Comment>>() {
		}.getType();
		Gson gson = new Gson();
		PageModel<Comment> pageModel = new PageModel<Comment>();
		pageModel.setPageSize( PAGE_SIZE_OF_COMMENT );
		pageModel.setPageNum( pageNumInt );
		try {
			int feedIdInt = IntegerUtil.exceptionIfSmallerThan0( feedId );
			pageModel.setItemList( commentManager.queryLasted( pageNumInt, feedIdInt ) );
		} catch ( Exception e ) {
			pageModel.setState( PageModelState.ERROR.getKey() );
			e.printStackTrace();
		}
		ServletUtil.writeToResponse( response, gson.toJson( pageModel, listType ) );
	}
	
	@RequestMapping( value = "/comment/add.html" )
	public void add( HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "feedId", required = false ) String feedId,//
			@RequestParam( value = "userId", required = false ) String userId,//
			@RequestParam( value = "commentContent", required = false ) String commentContent ) {

		int feedIdInt = 0;
		int userIdInt = 0;
		try {
			feedIdInt = IntegerUtil.exceptionIfSmallerThan0( feedId );
			userIdInt = IntegerUtil.exceptionIfSmallerThan0( userId );
			if( StringUtil.isBlank( commentContent ) ){
				throw new Exception( "" );
			}
		} catch ( Exception e ) {
			ServletUtil.writeToResponse( response, "Error when add comment!" );
			e.printStackTrace();
		}
		Comment comment = new Comment( feedIdInt, userIdInt, StringUtil.trimToEmpty( commentContent ) );
		try {
			if( commentManager.addComment( comment ) ){
				ServletUtil.writeToResponse( response, "SUCCESS" );
			}
		} catch ( ServiceException e ) {
			ServletUtil.writeToResponse( response, "Error when add comment!" );
			e.printStackTrace();
		}
	}
	
	
	
	
	

}
