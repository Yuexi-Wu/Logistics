package com.logistics.model.po;

public class Customer {
	
	private int customerId;
	private String customerName;
	private String gender;
	private String identity;
	private String telephone;
	private String email;
	private int postcode;
	private String hasOrder;
	private String adProvince;
	private String adCity;
	private String adDetail;
	private int cusStatus;
	private Province province;
	private City city;
	
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getHasOrder() {
		return hasOrder;
	}
	public void setHasOrder(String hasOrder) {
		this.hasOrder = hasOrder;
	}
	public String getAdProvince() {
		return adProvince;
	}
	public void setAdProvince(String adProvince) {
		this.adProvince = adProvince;
	}
	public String getAdCity() {
		return adCity;
	}
	public void setAdCity(String adCity) {
		this.adCity = adCity;
	}
	public String getAdDetail() {
		return adDetail;
	}
	public void setAdDetail(String adDetail) {
		this.adDetail = adDetail;
	}
	public int getCusStatus() {
		return cusStatus;
	}
	public void setCusStatus(int cusStatus) {
		this.cusStatus = cusStatus;
	}
	
	public String getAddressString(){
		return adProvince+adCity+adDetail;
	}
	public Province getProvince() {
		return province;
	}
	public void setProvince(Province province) {
		this.province = province;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	
	
}
