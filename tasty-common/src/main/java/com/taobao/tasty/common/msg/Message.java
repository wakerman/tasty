/**
 * 
 */
package com.taobao.tasty.common.msg;


/**
 * @author cangya
 *
 */
public class Message{

	private String fromUserId;
	
	private String toUserId;
	
	protected Object message;
	
	public Message(String fromUserId, String toUserId, Object message) {
		this.fromUserId = fromUserId;
		this.toUserId = toUserId;
		this.message = message;
	}

	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#getFromUserId()
	 */
	public String getFromUserId() {
		return this.fromUserId;
	}

	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#setFromUserId(java.lang.String)
	 */
	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}

	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#getToUserId()
	 */
	public String getToUserId() {
		return this.toUserId;
	}

	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#setToUserId(java.lang.String)
	 */
	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#getMessage()
	 */
	public Object getMessage() {
		return this.message;
	}

	/* (non-Javadoc)
	 * @see org.zero.realtime.base.Message#setMessage(java.lang.Object)
	 */
	public void setMessage(Object message) {
		this.message = message;
	}
	
	public String toString() {
		return this.fromUserId + " -> " + this.toUserId + " : " + this.message;
	}

}
