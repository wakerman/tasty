package com.taobao.tasty.web.controller;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_COMMENT;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.taobao.tasty.common.type.OperType;
import com.taobao.tasty.common.type.PageModel;
import com.taobao.tasty.common.type.PageModelState;
import common.toolkit.java.entity.DateFormat;
import common.toolkit.java.exception.ServiceException;
import common.toolkit.java.util.DateUtil;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.io.ServletUtil;
import common.toolkit.java.util.number.IntegerUtil;

/**
 * 对应喜欢的功能
 * 
 * @author nileader nileader@gmail.com
 * @date 2012-12-22
 */
@Controller
public class LikeController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger( LikeController.class );

	// /**
	// * Page of search
	// *
	// * @param request
	// * @param response
	// * @param message
	// * @return
	// */
	// @RequestMapping( value = "/comment/query.html" )
	// public void query( HttpServletRequest request, HttpServletResponse
	// response, //
	// @RequestParam( value = "message", required = false ) String message,//
	// @RequestParam( value = "feedId", required = false ) String feedId,//
	// @RequestParam( value = "pageNum", required = false ) String pageNum ) {
	//
	// int pageNumInt = IntegerUtil.defaultIfError( pageNum, 1 );
	// Type listType = new TypeToken<PageModel<Comment>>() {
	// }.getType();
	// Gson gson = new Gson();
	// PageModel<Comment> pageModel = new PageModel<Comment>();
	// pageModel.setPageSize( PAGE_SIZE_OF_COMMENT );
	// pageModel.setPageNum( pageNumInt );
	// try {
	// int feedIdInt = IntegerUtil.exceptionIfSmallerThan0( feedId );
	// pageModel.setItemList( commentManager.queryLasted( pageNumInt, feedIdInt
	// ) );
	// } catch ( Exception e ) {
	// pageModel.setState( PageModelState.ERROR.getKey() );
	// e.printStackTrace();
	// }
	// ServletUtil.writeToResponse( response, gson.toJson( pageModel, listType )
	// );
	// }

	@RequestMapping( value = "/like/action.html" )
	public void action( HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "feedId", required = false ) String feedId,//
			@RequestParam( value = "userId", required = false ) String userId,//
			@RequestParam( value = "operType", required = false ) String operType ) {

		int feedIdInt = 0;
		int userIdInt = 0;
		operType = StringUtil.trimToEmpty( operType );
		Type resultType = new TypeToken<Map<String, String>>() {
		}.getType();
		Gson gson = new Gson();

		try {
			feedIdInt = IntegerUtil.exceptionIfSmallerThan0( feedId );
//			userIdInt = IntegerUtil.exceptionIfSmallerThan0( userId );
			if( OperType.LIKE_ADD.getKey().equalsIgnoreCase( operType ) ){
				if ( !likeManager.addLikeNumOfFeed( feedIdInt ) ) {
					throw new Exception( "Error when addLikeNumOfFeedComment" );
				}
			}else if( OperType.LIKE_CANCEL.getKey().equalsIgnoreCase( operType ) ){
				if ( !likeManager.cancelLike( feedIdInt, userIdInt ) ) {
					throw new Exception( "Error when cancelLike" );
				}
			}else{
				throw new Exception( "Unknow oper type" );
			}
			Map<String, String> map = new HashMap<String, String>();
			map.put( "state", "OK" );
			ServletUtil.writeToResponse( response, gson.toJson( map, resultType ) );
		} catch ( Exception e ) {
			Map<String, String> map = new HashMap<String, String>();
			map.put( "state", "ERROR" );
			ServletUtil.writeToResponse( response, gson.toJson( map, resultType ) );
			e.printStackTrace();
		}
	}

}
