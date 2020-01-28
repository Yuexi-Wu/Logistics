package com.logistics.model.po;

import java.sql.Timestamp;

public class ReturnOrder {
	private int returnId;
	private Order order;
	private int orderId;
	private int returnReason;
	private Timestamp returnDate;
	private Timestamp finishDate;
	private Product product;
	private String productName;
	private Double productPrice;
	private int returnAmount;
	
	
	
	public int getReturnId() {
		return returnId;
	}
	public void setReturnId(int returnId) {
		this.returnId = returnId;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getReturnReason() {
		return returnReason;
	}
	public void setReturnReason(int returnReason) {
		this.returnReason = returnReason;
	}
	public Timestamp getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}
	public Timestamp getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Timestamp finishDate) {
		this.finishDate = finishDate;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getReturnAmount() {
		return returnAmount;
	}
	public void setReturnAmount(int amount) {
		this.returnAmount = amount;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

}
