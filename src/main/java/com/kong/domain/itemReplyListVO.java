package com.kong.domain;

import java.util.Date;

public class itemReplyListVO {

	private int itemNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date regDate;
	private String userName;
	private double rating;

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "itemReplyListVO [itemNum=" + itemNum + ", userId=" + userId + ", repNum=" + repNum + ", repCon="
				+ repCon + ", regDate=" + regDate + ", userName=" + userName + ", rating=" + rating + "]";
	}

}
