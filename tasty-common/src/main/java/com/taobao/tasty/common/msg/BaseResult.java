package com.taobao.tasty.common.msg;

public class BaseResult {
	public static final String STATE_OK = "OK";
	public static final String STATE_ERROR = "ERROR";
	
	private boolean result;
	private String state;
	private int pageNum;
	private int pageSize;
	private int errorCode;
	private String resultNote;

	public boolean isSuccess() {
		return result;
	}

	public BaseResult setResult(boolean result) {
		this.result = result;
		return this;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public BaseResult setErrorCode(int errorCode) {
		this.errorCode = errorCode;
		return this;
	}

	public String getResultNote() {
		return resultNote;
	}

	public BaseResult setResultNote(String resultNote) {
		this.resultNote = resultNote;
		return this;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
}
