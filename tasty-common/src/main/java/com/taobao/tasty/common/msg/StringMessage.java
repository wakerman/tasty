/**
 * 
 */
package com.taobao.tasty.common.msg;

/**
 * @author cangya
 *
 */
public class StringMessage extends Message{

	public StringMessage(String fromUserId, String toUserId, String message) {
		super(fromUserId, toUserId, message);
	}
	
	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#getMessage()
	 */
	public String getMessage() {
		return (String)this.message;
	}

	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#setMessage(java.lang.Object)
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
}
