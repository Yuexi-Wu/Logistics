package com.logistics.model.dao.returnOrder;

import java.util.List;

import com.logistics.model.po.Order;
import com.logistics.model.po.ReturnOrder;

public interface OrderDAO {
	
	public Order getOrderById(int orderId);

	void generateReturnOrder(ReturnOrder rOrder, Order order);

	List<Order> selectPageOrder(String cusName, String identity, int pageSize, int pageNum);

	List<Order> selectAndFilterCustomerOrder(String cusName, String identity, int pageSize, int pageNum);

	int selectOrderPageCount(String cusName, String identity, int pageSize);

	List<ReturnOrder> getAllReturn();

}
