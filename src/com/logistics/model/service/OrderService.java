package com.logistics.model.service;

import java.sql.Connection;
import java.util.List;
import com.logistics.model.dao.returnOrder.*;
import com.logistics.model.po.Order;
import com.logistics.model.po.ReturnOrder;
import com.logistics.utils.DBUtil;

public class OrderService {
public OrderService(){
		
	}
	
	private static OrderService service = new OrderService();
	
	public static OrderService getInstance(){
		return service;
	}
	
	public void  generateReturnOrder(ReturnOrder rOrder,Order order){
		Connection connection = DBUtil.getConn();
		DBUtil.beginTransaction(connection);
		try {
			OrderDAO dao = new OrderDAOImp(connection);
			dao. generateReturnOrder(rOrder,order);
			DBUtil.commit(connection);
		} catch (Exception e) {
			// TODO: handle exception
			DBUtil.rollback(connection);
		}finally {
			DBUtil.closeConn(connection);
		}	
	}
	
	public Order getOrderById(int orderId){
		Connection connection = DBUtil.getConn(); 
		OrderDAO dao = new OrderDAOImp(connection);
		return dao.getOrderById(orderId);
	}
	
	public List<Order> selectAndFilterPageCustomerOrder(String cusName, String identity, int pageSize,
			int pageNum){
		Connection connection = DBUtil.getConn(); 
		OrderDAO dao = new OrderDAOImp(connection);
		return dao.selectAndFilterCustomerOrder(cusName, identity, pageSize,pageNum);
	}
	
	public int selectOrderPageCount(String cusName, String identity, int pageSize){
		Connection connection = DBUtil.getConn(); 
		OrderDAO dao = new OrderDAOImp(connection);
		return dao.selectOrderPageCount(cusName, identity, pageSize);
	}
	
	public List<Order> selectPageCustomerOrder(String cusName, String identity, int pageSize,
			int pageNum){
		Connection connection = DBUtil.getConn(); 
		OrderDAO dao = new OrderDAOImp(connection);
		return dao.selectPageOrder(cusName, identity, pageSize,pageNum);
	}
	
	public List<ReturnOrder> getAllReturn(){
		Connection connection = DBUtil.getConn(); 
		OrderDAO dao = new OrderDAOImp(connection);
		return dao.getAllReturn();
	}

}
