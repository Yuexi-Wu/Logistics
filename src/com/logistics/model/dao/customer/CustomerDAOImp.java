package com.logistics.model.dao.customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;

import com.logistics.model.po.Customer;
import com.logistics.model.po.Order;
import com.logistics.model.po.OrderStatus;
import com.logistics.utils.DBUtil;

public class CustomerDAOImp implements CustomerDAO{

	Connection connection;
	
	public CustomerDAOImp(Connection connection){
		this.connection = connection;
	}
	
	
	@Override
	public void register(Customer customer){
		java.sql.PreparedStatement ps = null;
		try {
			Calendar calendar = Calendar.getInstance();
			int year = calendar.get(Calendar.YEAR);
			int dateyear = year%100;
			int datemonth = calendar.get(Calendar.MONTH);
			int datedate = calendar.get(Calendar.DATE);
			String dateString = ""+dateyear+datemonth+datedate;
			String rdm = DBUtil.getFourRandom();
			String idString = dateString+rdm;
			int cusId = Integer.valueOf(idString).intValue();
			ps = connection.prepareStatement("insert into customer values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, cusId);
			System.out.println(cusId);
			ps.setString(2, customer.getCustomerName());
			String gender = customer.getGender();
			int g = 0;
			if(gender=="male"){
				g = 1;
			}
			ps.setInt(3, g);
			ps.setString(4, customer.getIdentity());
			ps.setString(5, customer.getTelephone());
			ps.setString(6, customer.getAdProvince());
			ps.setString(7, customer.getAdCity());
			ps.setString(8,customer.getAdDetail());
			ps.setString(9, customer.getEmail());
			ps.setInt(10, customer.getPostcode());
			ps.setInt(11, 1);
			ps.setInt(12, 002);
			ps.setDate(13, null);
			System.out.println("22");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closePS(ps);
		}
	}
	
	@Override
	public List<Customer> selectCustomer(String cusName, String identity, int cusStatus) {
		List<Customer> list = new ArrayList<Customer>();
		StringBuffer sbf = new StringBuffer("");
		sbf.append("  select *  from  customer where 1=1");
		if(cusName != null && !"".equals(cusName)){
			sbf.append(" and customer_name=? ");
		}
		if(identity != null && !"".equals(identity)){
			sbf.append(" and identity=? ");
		}
		if(cusStatus==0||cusStatus==1||cusStatus==2){
			sbf.append(" and customer_status=? ");
		}
		try {
			PreparedStatement ps = connection.prepareStatement(sbf.toString());
			int index=1;
			if(cusName != null && !"".equals(cusName)){
				ps.setString(index, cusName);
				index++;
			}
			if(identity != null && !"".equals(identity)){
				ps.setString(index, identity);
				index++;
			}
			if(cusStatus==0||cusStatus==1||cusStatus==2){
				ps.setInt(index, cusStatus);
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Customer customer = new Customer();
				customer.setCustomerId(rs.getInt("customer_id"));
				customer.setCustomerName(rs.getString("customer_name"));
				int gender=rs.getInt("gender");
				String gString = "";
				if(gender==0){
					gString="female";
				}
				if(gender==1){
					gString="male";
				}
				customer.setGender(gString);
				customer.setIdentity(rs.getString("identity"));
				customer.setTelephone(rs.getString("telephone"));
				customer.setAdProvince(rs.getString("address_province"));
				customer.setAdCity(rs.getString("address_city"));
				customer.setAdDetail(rs.getString("address_detail"));
				customer.setEmail(rs.getString("email"));
				customer.setPostcode(rs.getInt("postcode"));
				customer.setCusStatus(rs.getInt("customer_status"));
				list.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Order> selectCustomerOrder(String cusName, String identity, String telephone) {
		List<Order> orders = new ArrayList<Order>();
		StringBuffer sbf = new StringBuffer("");
		sbf.append("  select *  from  customer c inner join order o on c.customer_id=o.customer_id where 1=1  ");
		if(cusName != null && !"".equals(cusName)){
			sbf.append(" and customer_name=? ");
		}
		if(identity != null && !"".equals(identity)){
			sbf.append(" and identity=? ");
		}
		if(telephone != null && !"".equals(telephone)){
			sbf.append(" and telephone=? ");
		}
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sbf.toString());
			int index=1;
			if(cusName != null && !"".equals(cusName)){
				ps.setString(index, cusName);
				index++;
			}
			if(identity != null && !"".equals(identity)){
				ps.setString(index, identity);
				index++;
			}
			if(telephone != null && !"".equals(telephone)){
				ps.setString(index, telephone);
			}
			//得到所有客户信息
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int productId = rs.getInt("product_id");
				PreparedStatement newPs = connection.prepareStatement("select * from product where product_id = " + productId);
				ResultSet newRs = newPs.executeQuery();
				Order order = new Order();
				order.setId(rs.getInt("order_id"));
				order.setProductName(newRs.getString("product_name"));
				order.setProductId(newRs.getInt("product_id"));
				order.setAmount(rs.getInt("order_amount"));
				order.setBuyingPrice(rs.getDouble("buying_price"));
				order.setTotalPrice(rs.getDouble("total_price"));
				order.setRcvName(rs.getString("receiver_name"));
				int status = rs.getInt("order_status");
				OrderStatus orderStatus = null;
				if(status==0){
					orderStatus=OrderStatus.Fail;
				}
				if(status==1){
					orderStatus=OrderStatus.Allocatable;
				}
				if(status==2){
					orderStatus=OrderStatus.Dispatched;
				}
				if(status==3){
					orderStatus=OrderStatus.CentralStockOut;
				}
				if(status==4){
					orderStatus=OrderStatus.SubstationArrival;
				}
				if(status==5){
					orderStatus=OrderStatus.Allocated;
				}
				if(status==6){
					orderStatus=OrderStatus.PickedUp;
				}
				if(status==7){
					orderStatus=OrderStatus.Delivered;
				}
				if(status==8){
					orderStatus=OrderStatus.ShortSupply;
				}
				order.setStatus(orderStatus);
				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}
	
	

	@Override
	public List<Customer> selectPageCustomer(String cusName, String identity, int cusStatus, int pageSize,
			int pageNum) {
		List<Customer> list = new ArrayList<Customer>();
		StringBuffer sbf = new StringBuffer("");
		sbf.append("  select *  from  customer where 1=1 ");
		if(cusName != null && !"".equals(cusName)){
			sbf.append(" and customer_name=? ");
		}
		if(identity != null && !"".equals(identity)){
			sbf.append(" and identity=? ");
		}
		if(cusStatus==0||cusStatus==1||cusStatus==2){
			sbf.append(" and customer_status=? ");
		}
		sbf.append(" limit " + ((pageNum - 1) * pageSize) + "," + pageSize);
		try {
			PreparedStatement ps = connection.prepareStatement( sbf.toString());
			int index=1;
			if(cusName != null && !"".equals(cusName)){
				ps.setString(index, cusName);
				index++;
			}
			if(identity != null && !"".equals(identity)){
				ps.setString(index, identity);
				index++;
			}
			if(cusStatus==0||cusStatus==1||cusStatus==2){
				ps.setInt(index, cusStatus);
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Customer customer = new Customer();
				customer.setCustomerId(rs.getInt("customer_id"));
				customer.setCustomerName(rs.getString("customer_name"));
				int gender=rs.getInt("gender");
				String gString="";
				if(gender==0){
					gString="female";
				}
				if(gender==1){
					gString="male";
				}
				customer.setGender(gString);
				customer.setIdentity(rs.getString("identity"));         
				customer.setTelephone(rs.getString("telephone"));
				customer.setAdProvince(rs.getString("address_province"));
				customer.setAdCity(rs.getString("address_city"));
				customer.setAdDetail(rs.getString("address_detail"));
				customer.setEmail(rs.getString("email"));
				customer.setPostcode(rs.getInt("postcode"));
				customer.setCusStatus(rs.getInt("customer_status"));
				list.add(customer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int selectPageCount(String cusName, String identity, int pageSize) {
		int count = 0;
		StringBuffer sbf = new StringBuffer("");
		sbf.append(" select count(*) cc  from  customer where 1=1  ");
		if(cusName != null && !"".equals(cusName)){
			sbf.append(" and username=? ");
		}
		if(identity != null && !"".equals(identity)){
			sbf.append(" and identity=? ");
		}
		try {
			PreparedStatement ps =  connection.prepareStatement(sbf.toString());
			int index=1;
			if(cusName != null && !"".equals(cusName)){
				ps.setString(index, cusName);
				index++;
			}
			if(identity != null && !"".equals(identity)){
				ps.setString(index, identity);
			}
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt("cc");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int pagecount = 0;
		if(count%pageSize==0){
			pagecount = count/pageSize;
		}else{
			pagecount = count/pageSize+1;
		}
		return pagecount;
	}

	@Override
	public void deleteCustomer(int cusId) {
		PreparedStatement ps = null;
		try {
			ps = (PreparedStatement) connection.prepareStatement(" update customer set customer_status=0  "
					+ "  where customer_id = ? ");
			ps.setInt(1, cusId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closePS(ps);
		}
	}
	
	@Override
	public int checkCustomerStatus(int cusId){
		PreparedStatement ps = null;
		int status = 1;
		try {
			ps = (PreparedStatement) connection.prepareStatement(" select customer_status from  customer  "
					+ "  where customer_id = ? ");
			ps.setInt(1, cusId);
			ResultSet rSet = ps.executeQuery();
			if(rSet.next()){
				status = rSet.getInt("customer_status");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closePS(ps);
		}
		return status;
	}

	@Override
	public Customer getCustomerById(int cusId) {
		Customer customer = new Customer();
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) connection.prepareStatement("  select *  from customer  where customer_id=? ");
			ps.setInt(1, cusId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				customer.setCustomerName(rs.getString("customer_name"));
				customer.setGender(rs.getString("gender"));
				customer.setIdentity(rs.getString("identity"));
				customer.setTelephone(rs.getString("telephone"));
				customer.setAdProvince(rs.getString("address_province"));
				customer.setAdCity(rs.getString("address_city"));
				customer.setAdDetail(rs.getString("address_detail"));
				customer.setEmail(rs.getString("email"));
				customer.setPostcode(rs.getInt("postcode"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}

	@Override
	public void updateCustomer(Customer customer) {
		PreparedStatement ps = null;
		try {
			ps = (PreparedStatement) connection.prepareStatement(" update customer set customer_name=?,gender=?,identity=?,"
					+ "telephone=?,address_province=?,address_city=?,address_detail=?,email=?,postcode=?"
					+ " where customer_id=? ");
			ps.setString(1, customer.getCustomerName());
			String gender = customer.getGender();
			int g=0;
			if(gender=="male"){
				g=1;
			}
			
			ps.setInt(2,g);
			ps.setString(3, customer.getIdentity());
			ps.setString(4, customer.getTelephone());
			ps.setString(5, customer.getAdProvince());
			ps.setString(6, customer.getAdCity());
			ps.setString(7, customer.getAdDetail());
			ps.setString(8, customer.getEmail());
			ps.setInt(9, customer.getPostcode());
			ps.setInt(10, customer.getCustomerId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.closePS(ps);
		}
	}
	
	@Override
	public Customer validateCustomerName(String cusName){
		Customer customer = null;
		PreparedStatement pStatement;
		try {
			pStatement = (PreparedStatement) connection.prepareStatement("select * from customer where customer_name = ?");
			pStatement.setString(1, cusName);
			ResultSet rSet = pStatement.executeQuery();
			if(rSet.next()){
				customer = new Customer();
				customer.setCustomerId(rSet.getInt("customer_id"));
				customer.setCustomerName(rSet.getString("customer_name"));
				boolean gender = rSet.getBoolean("gender");
				if(gender==true){
					customer.setGender("male");
				}else{
					customer.setGender("female");
				}
				customer.setIdentity(rSet.getString("identity"));
				customer.setTelephone(rSet.getString("telephone"));
				customer.setEmail(rSet.getString("email"));
				customer.setPostcode(rSet.getInt("postcode"));
				customer.setAdProvince(rSet.getString("address_province"));
				customer.setAdCity(rSet.getString("address_city"));
				customer.setAdDetail(rSet.getString("address_detail"));
				int status = rSet.getInt("customer_status");
//				String cstatus = null;
//				if(status==0){
//					cstatus = "deleted";
//				}
//				if(status==1){
//					cstatus = "noOrder";
//				}
//				if(status==2){
//					cstatus = "hasOrder";
//				}
				customer.setCusStatus(status);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customer;
	}
}
