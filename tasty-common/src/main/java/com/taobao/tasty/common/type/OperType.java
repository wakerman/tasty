package com.taobao.tasty.common.type;
/**
 * 操作类型<br>
 * @author nileader nileader@gmail.com
 * @date 2012-12-22
 */
public enum OperType {

	LIKE_ADD("LIKE_ADD","LIKE_ADD","喜欢"),//
	LIKE_CANCEL("LIKE_CANCEL","LIKE_CANCEL","取消喜欢");

	private String key;
	private String name;
	private String desc;
	
	private OperType( String key, String name, String desc ) {
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
