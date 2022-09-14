package com.kong.domain;

import java.util.Date;

public class itemVO {

	private int itemNum;
	private String itemName;
	private String cateCode;
	private int itemPrice;
	private int itemStock;
	private String itemDes;
	private String itemImg;
	private Date regDate;
	private String itemThumbImg;

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}

	public String getItemDes() {
		return itemDes;
	}

	public void setItemDes(String itemDes) {
		this.itemDes = itemDes;
	}

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getItemThumbImg() {
		return itemThumbImg;
	}

	public void setItemThumbImg(String itemThumbImg) {
		this.itemThumbImg = itemThumbImg;
	}

	@Override
	public String toString() {
		return "itemVO [itemNum=" + itemNum + ", itemName=" + itemName + ", cateCode=" + cateCode + ", itemPrice="
				+ itemPrice + ", itemStock=" + itemStock + ", itemDes=" + itemDes + ", itemImg=" + itemImg
				+ ", regDate=" + regDate + ", itemThumbImg=" + itemThumbImg + "]";
	}

}
