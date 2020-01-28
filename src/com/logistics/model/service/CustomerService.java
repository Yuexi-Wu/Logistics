package com.logistics.model.service;

import java.sql.Connection;
import java.util.List;

import com.logistics.model.dao.customer.CustomerDAO;
import com.logistics.model.dao.customer.CustomerDAOImp;
import com.logistics.model.po.Customer;
import com.logistics.utils.DBUtil;

public class CustomerService {
public CustomerService(){
		
	}
	
	private static CustomerService service = new CustomerService();
	
	public static CustomerService getInstance(){
		return service;
	}
	
	public void register(Customer customer){
		Connection connection = DBUtil.getConn();
		DBUtil.beginTransaction(connection);
		try {
			CustomerDAO dao = new CustomerDAOImp(connection);
			dao.register(customer);
			DBUtil.commit(connection);
		} catch (Exception e) {
			// TODO: handle exception
			DBUtil.rollback(connection);
		}finally {
			DBUtil.closeConn(connection);
		}	
	}
	
	public List<Customer> selectCustomer(String cusName, String identity, int cusStatus){
		Connection connection = DBUtil.getConn(); 
		CustomerDAO dao = new CustomerDAOImp(connection);
		return dao.selectCustomer(cusName, identity, cusStatus);
	}
	
	public List<Customer> selectCustomer(String cusName, String identity, int cusStatus, int pageSize,
			int pageNum){
		Connection connection = DBUtil.getConn(); 
		CustomerDAO dao = new CustomerDAOImp(connection);
		return dao.selectPageCustomer(cusName, identity, cusStatus, pageSize, pageNum);
	}
	
	public int selectPageCount(String cusName, String identity, int pageSize){
		Connection connection = DBUtil.getConn(); 
		CustomerDAO dao = new CustomerDAOImp(connection);
		return dao.selectPageCount(cusName, identity, pageSize);
	}
	
	public void deleteCustomer(int cusId){
		Connection connection = DBUtil.getConn();
		DBUtil.beginTransaction(connection);
		try {
			CustomerDAO dao = new CustomerDAOImp(connection);
			dao.deleteCustomer(cusId);
			DBUtil.commit(connection);
		} catch (Exception e) {
			// TODO: handle exception
			DBUtil.rollback(connection);
		}finally {
			DBUtil.closeConn(connection);
		}	
	}
	
	public Customer getCustomerById(int cusId){
		Connection connection = DBUtil.getConn(); 
		CustomerDAO dao = new CustomerDAOImp(connection);
		return dao.getCustomerById(cusId);
	}

	public int checkCustomerStatus(int cusId){
		Connection connection = DBUtil.getConn(); 
		CustomerDAO dao = new CustomerDAOImp(connection);
		return dao.checkCustomerStatus(cusId);
	}

	public void updateCustomer(Customer customer){
		Connection connection = DBUtil.getConn();
		DBUtil.beginTransaction(connection);
		try {
			CustomerDAO dao = new CustomerDAOImp(connection);
			dao.updateCustomer(customer);
			DBUtil.commit(connection);
		} catch (Exception e) {
			// TODO: handle exception
			DBUtil.rollback(connection);
		}finally {
			DBUtil.closeConn(connection);
		}
	}
	
	
	public boolean validateCustomerName(String cusName){
		Connection connection = DBUtil.getConn(); 
		CustomerDAO dao = new CustomerDAOImp(connection);
		Customer customer=dao.validateCustomerName(cusName);
		DBUtil.closeConn(connection);
		if(customer==null){
			return false;
		}else{
			return true;
		}
	}
	
}
