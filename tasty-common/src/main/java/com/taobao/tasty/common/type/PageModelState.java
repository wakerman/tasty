package com.taobao.tasty.common.type;
/**
 * Datasource 类型<br>
 * 目前支持：<br>
 * 1. HSF接口类型的数据源
 * @author nileader nileader@gmail.com
 * @date Sep 6, 2012
 */
public enum PageModelState {

	//HSF接口类型的数据源
	OK("OK","OK","成功"),//
	ERROR("ERROR","ERROR","失败");

	private String key;
	private String name;
	private String desc;
	
	private PageModelState( String key, String name, String desc ) {
		this.key		= key;
		this.name	= name;
		this.desc	= desc;
	}
	
	public String getKey(){
		return this.key;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getDesc(){
		return this.desc;
	}

}
