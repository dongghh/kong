package com.kong.domain;

public class OrderDetailVO {

	private int orderDetailsNum;
	private String orderId;
	private int itemNum;
	private int cartStock;

	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}

	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	@Override
	public String toString() {
		return "OrderDetailVO [orderDetailsNum=" + orderDetailsNum + ", orderId=" + orderId + ", itemNum=" + itemNum
				+ ", cartStock=" + cartStock + "]";
	}

}
