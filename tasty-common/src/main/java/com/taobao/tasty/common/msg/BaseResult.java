package com.taobao.tasty.common.msg;

public class BaseResult {
	private boolean result;
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

}
