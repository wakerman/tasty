package com.taobao.tasty.common.type;

import java.util.List;


/**
 * @author nileader/nileader@gmail.com
 */
public class PageModel<T> {

	/** 当前页码 */
	private int pageNum;
	/** 响应状态 */
	private String state = PageModelState.OK.getKey();
	
	/**排序类型*/
	private String sortType;
	
	/** 页面大小 */
	private int pageSize;
	
	/** item list */
	private List<T> itemList;
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum( int pageNum ) {
		this.pageNum = pageNum;
	}
	public String getState() {
		return state;
	}
	public void setState( String state ) {
		this.state = state;
	}
	public List<T> getItemList() {
		return itemList;
	}
	public void setItemList( List<T> itemList ) {
		this.itemList = itemList;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType( String sortType ) {
		this.sortType = sortType;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize( int pageSize ) {
		this.pageSize = pageSize;
	}
	
	
}
