package com.kong.domain;

import java.util.Date;

public class MemberVO {

	private String userId;
	private String userPass;
	private String userName;
	private String userEmail;
	private String userAddress;
	private String userPnumber;
	private Date regDate;
	private int verify;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserPnumber() {
		return userPnumber;
	}
	public void setUserPnumber(String userPnumber) {
		this.userPnumber = userPnumber;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userAddress=" + userAddress + ", userPnumber=" + userPnumber + ", regDate=" + regDate
				+ ", verify=" + verify + "]";
	}
	
	

	
	
}
