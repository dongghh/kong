package com.kong.domain;

import java.util.Date;

public class itemReplyVO {

	private int itemNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date regDate;

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRepNum() {
		return repNum;
	}

	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}

	public String getRepCon() {
		return repCon;
	}

	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "itemReplyVO [itemNum=" + itemNum + ", userId=" + userId + ", repNum=" + repNum + ", repCon=" + repCon
				+ ", regDate=" + regDate + "]";
	}

}
