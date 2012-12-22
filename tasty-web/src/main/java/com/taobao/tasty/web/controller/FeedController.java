package com.taobao.tasty.web.controller;

import static com.taobao.tasty.common.constant.SystemConstant.PAGE_SIZE_OF_FEED;
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
import com.taobao.tasty.common.model.Feed;
import com.taobao.tasty.common.type.PageModel;
import com.taobao.tasty.common.type.PageModelState;
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
public class FeedController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger( FeedController.class );

	/**
	 * Page of search
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
		
		Type listType = new TypeToken< PageModel<Feed> >() {}.getType();
		Gson gson = new Gson(); 
		PageModel<Feed> pageModel = new PageModel<Feed>();
		try {

			if( "recommend".equalsIgnoreCase( sortType ) ){
				List<Feed> feedList = feedManager.queryRecommend( IntegerUtil.defaultIfError( pageNum, 1 ) );
				pageModel.setItemList( feedList );
			}else if( "nearby".equalsIgnoreCase( sortType ) ){
				pageModel.setState( PageModelState.ERROR.getKey() );
			}else{
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
		ServletUtil.writeToResponse( response, gson.toJson( pageModel, listType) );		
	}
	
	
	
	
	
}
