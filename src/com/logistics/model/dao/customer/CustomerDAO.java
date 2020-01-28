package com.logistics.model.dao.customer;

import java.util.List;

import com.logistics.model.po.Customer;
import com.logistics.model.po.Order;

public interface CustomerDAO {
	
	public void register(Customer customer);

	public List<Customer> selectCustomer(String cusName, String identity, int cusStatus);
	
	public int selectPageCount(String cusName, String identity,  int pageSize);
	
	public void deleteCustomer(int cusId);
	
	public Customer getCustomerById(int cusId);

	public int checkCustomerStatus(int cusId);

	public void updateCustomer(Customer customer);

	public List<Order> selectCustomerOrder(String cusName, String identity, String telephone);

	public Customer validateCustomerName(String cusName);

	List<Customer> selectPageCustomer(String cusName, String identity, int cusStatus, int pageSize, int pageNum);

}
