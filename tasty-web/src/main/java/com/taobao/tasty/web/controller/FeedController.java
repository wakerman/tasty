package com.taobao.tasty.web.controller;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_FEED;

import java.io.File;
import java.lang.reflect.Type;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.taobao.tasty.common.constant.SystemConstant;
import com.taobao.tasty.common.model.Feed;
import com.taobao.tasty.common.type.PageModel;
import com.taobao.tasty.common.type.PageModelState;

import common.toolkit.java.entity.DateFormat;
import common.toolkit.java.util.DateUtil;
import common.toolkit.java.util.StringUtil;
import common.toolkit.java.util.io.ServletUtil;
import common.toolkit.java.util.number.IntegerUtil;
import common.toolkit.java.util.number.LongUtil;

/**
 * Search Controller
 * 
 * @author nileader nileader@gmail.com
 * @date Sep 11, 2012
 */
@Controller
public class FeedController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger( FeedController.class );

	/**
	 * Page of search
	 * 
	 * @param request
	 * @param response
	 * @param message
	 * @return
	 */
	@RequestMapping( value = "/feed/query.html" )
	public void query( HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "message", required = false ) String message,//
			@RequestParam( value = "sortType", required = false ) String sortType,//
			@RequestParam( value = "pageNum", required = false ) String pageNum ) {

		sortType = StringUtil.defaultIfBlank( sortType, "lasted" );
		int pageNumInt = IntegerUtil.defaultIfError( pageNum, 1 );

		Type listType = new TypeToken<PageModel<Feed>>() {
		}.getType();
		Gson gson = new Gson();
		PageModel<Feed> pageModel = new PageModel<Feed>();
		try {

			if ( "recommend".equalsIgnoreCase( sortType ) ) {
				List<Feed> feedList = feedManager.queryRecommend( IntegerUtil.defaultIfError( pageNum, 1 ) );
				pageModel.setItemList( feedList );
			} else if ( "nearby".equalsIgnoreCase( sortType ) ) {
				pageModel.setState( PageModelState.ERROR.getKey() );
			} else {
				sortType = "lasted";
				List<Feed> feedList = feedManager.queryLasted( IntegerUtil.defaultIfError( pageNum, 1 ) );
				pageModel.setItemList( feedList );
			}
			pageModel.setPageNum( pageNumInt );
			pageModel.setPageSize( PAGE_SIZE_OF_FEED );
			pageModel.setSortType( sortType );
		} catch ( Exception e ) {
			pageModel.setState( PageModelState.ERROR.getKey() );
			e.printStackTrace();
		}
		ServletUtil.writeToResponse( response, gson.toJson( pageModel, listType ) );
	}

	@RequestMapping( value = "/feed/publish.html", method = RequestMethod.POST )
	// 将文件上传请求映射到该方法
	public void publish( HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "userId", required = false ) String userId,//
			@RequestParam( value = "foodName", required = false ) String foodName,//
			@RequestParam( value = "feedContent", required = false ) String feedContent,//
			@RequestParam( value = "location", required = false ) String location,//
			@RequestParam( value = "pic", required = false ) CommonsMultipartFile pic ) {

		Type resultType = new TypeToken<Map<String, String>>() {
		}.getType();
		Gson gson = new Gson();

		long userIdNum = LongUtil.defaultIfError( userId, 0 );
		if ( 0 >= userIdNum ) {
			Map<String, String> map = new HashMap<String, String>();
			map.put( "state", "ERROR" );
			ServletUtil.writeToResponse( response, gson.toJson( map, resultType ) );
			return;
		}

		String fileName = StringUtil.trimToEmpty( pic.getFileItem().getFieldName() );
		String filePath = SystemConstant.BASE_PATH_OF_PIC + DateUtil.getNowTime( DateFormat.Date ) + "_"
				+ System.currentTimeMillis() + "_" + fileName;
		File file = new File( filePath );
		try {
			pic.getFileItem().write( file );
			//TODO 这里开始插入数据库中去~
		} catch ( Exception e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 将上传的文件写入新建的文件中
	}

	@RequestMapping( "/feed/index.html" )
	public ModelAndView index( HttpServletRequest request, HttpServletResponse response, //
			@RequestParam( value = "message", required = false ) String message,//
			@RequestParam( value = "queryString", required = false ) String queryString ) {

		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView( "index", model );
	}

}
