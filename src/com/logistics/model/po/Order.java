package com.logistics.model.po;

import java.sql.Timestamp;

public class Order {
	private int id;
	private Customer customer;
	private String customerName;
	private OrderStatus status;
	private OrderType type;
	private Operator operator;
	private Product product;
	private String productName;
	private int productId;
	private double buyingPrice;
	private int amount;
	private double totalPrice;
	private Timestamp generateDate;
	private Timestamp finishDate;
	private Timestamp actualFinishDate;
	private String rcvName;
	private String rcvPhone;
	private String rcvPostcode;
	private boolean needBill;
	private String adDetail;
	private String adCity;
	private String adProvince;
	private String cancelReason;
	private Timestamp cancelDate;
	private int lackAmount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public OrderStatus getStatus() {
		return status;
	}
	public void setStatus(OrderStatus status) {
		this.status = status;
	}
	public OrderType getType() {
		return type;
	}
	public void setType(OrderType type) {
		this.type = type;
	}
	public Operator getOperator() {
		return operator;
	}
	public void setOperator(Operator operator) {
		this.operator = operator;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getBuyingPrice() {
		return buyingPrice;
	}
	public void setBuyingPrice(double buyingPrice) {
		this.buyingPrice = buyingPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Timestamp getGenerateDate() {
		return generateDate;
	}
	public void setGenerateDate(Timestamp generateDate) {
		this.generateDate = generateDate;
	}
	public Timestamp getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Timestamp finishDate) {
		this.finishDate = finishDate;
	}
	public String getRcvName() {
		return rcvName;
	}
	public void setRcvName(String rcvName) {
		this.rcvName = rcvName;
	}
	public String getRcvPhone() {
		return rcvPhone;
	}
	public void setRcvPhone(String rcvPhone) {
		this.rcvPhone = rcvPhone;
	}
	public String getRcvPostcode() {
		return rcvPostcode;
	}
	public void setRcvPostcode(String rcvPostcode) {
		this.rcvPostcode = rcvPostcode;
	}
	public boolean isNeedBill() {
		return needBill;
	}
	public void setNeedBill(boolean needBill) {
		this.needBill = needBill;
	}
	public String getAdDetail() {
		return adDetail;
	}
	public void setAdDetail(String adDetail) {
		this.adDetail = adDetail;
	}
	public String getAdCity() {
		return adCity;
	}
	public void setAdCity(String adCity) {
		this.adCity = adCity;
	}
	public String getAdProvince() {
		return adProvince;
	}
	public void setAdProvince(String adProvince) {
		this.adProvince = adProvince;
	}
	public String getCancelReason() {
		return cancelReason;
	}
	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}
	public Timestamp getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(Timestamp cancelDate) {
		this.cancelDate = cancelDate;
	}
	public int getLackAmount() {
		return lackAmount;
	}
	public void setLackAmount(int lackAmount) {
		this.lackAmount = lackAmount;
	}
	public Timestamp getActualFinishDate() {
		return actualFinishDate;
	}
	public void setActualFinishDate(Timestamp actualFinishDate) {
		this.actualFinishDate = actualFinishDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String cusName) {
		customerName=cusName;
	}
	

}
