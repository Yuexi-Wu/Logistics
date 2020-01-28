package com.logistics.model.dao.returnOrder;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.sql.PreparedStatement;

import com.logistics.model.po.Customer;
import com.logistics.model.po.Order;
import com.logistics.model.po.OrderStatus;
import com.logistics.model.po.OrderType;
import com.logistics.model.po.ReturnOrder;
import com.logistics.model.service.CustomerService;
import com.logistics.model.service.OrderService;
import com.logistics.utils.DBUtil;

public class OrderDAOImp implements OrderDAO{
	
Connection connection;
	
	public OrderDAOImp(Connection connection){
		this.connection = connection;
	}
	
	@Override
	public List<Order> selectPageOrder(String cusName, String identity, int pageSize,
			int pageNum) {
		List<Order> orders = new ArrayList<Order>();
		StringBuffer sbf = new StringBuffer("");
		sbf.append("  select c.customer_id,customer_name,product_id,order_id,order_amount,buying_price,total_price,receiver_name,order_status,type  from  customer c right join `order` o on c.customer_id=o.customer_id where 1=1  ");
		if(cusName != null && !"".equals(cusName)){
			sbf.append(" and customer_name=? ");
		}
		if(identity != null && !"".equals(identity)){
			sbf.append(" and identity=? ");
		}
		sbf.append(" limit " + ((pageNum - 1) * pageSize) + "," + pageSize);
		try {
//			PreparedStatement ps = (PreparedStatement) connection.prepareStatement( " select b.* from ( "
//					+ " select a.*,rownum rw from ( "
//					+ sbf.toString() +  "  ) a "
//					+ " where rownum<= "+ (pageSize*pageNum) +" ) b  "
//					+ " where rw>"+ pageSize*(pageNum-1));
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
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int orderid = rs.getInt("order_id");
				int productId = rs.getInt("product_id");
				PreparedStatement newPs = (PreparedStatement) connection.prepareStatement("select * from product where product_id = " + productId);
				ResultSet newRs = newPs.executeQuery();
				Order order = OrderService.getInstance().getOrderById(orderid);
//				order.setId(rs.getInt("order_id"));
				order.setCustomerName(rs.getString("customer_name"));
				if(newRs.next()){
					order.setProductName(newRs.getString("product_name"));
				}
				order.setProductId(newRs.getInt("product_id"));
				order.setAmount(rs.getInt("order_amount"));
				order.setBuyingPrice(rs.getDouble("buying_price"));
				order.setTotalPrice(rs.getDouble("total_price"));
				order.setRcvName(rs.getString("receiver_name"));
				int type = rs.getInt("type");
				if(type==0){
					order.setType(OrderType.NewOrder);
				}
				if(type==1){
					order.setType(OrderType.ReturnOrder);
				}
				if(type==2){
					order.setType(OrderType.CancelOrder);
				}
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
	public Order getOrderById(int orderId){
		Order order = new Order();
		PreparedStatement pStatement;
		try {
			pStatement = connection.prepareStatement("select * from `order` where order_id=?");
			pStatement.setInt(1, orderId);
			ResultSet rs = pStatement.executeQuery();
			if(rs.next()){
				int productId = rs.getInt("product_id");
				PreparedStatement newPs = connection.prepareStatement("select * from product where product_id =? ");
				newPs.setInt(1, productId);
				ResultSet newRs = newPs.executeQuery();
				String productName = null;
				if(newRs.next()){
					 productName = newRs.getString("product_name");
				}
				order.setId(rs.getInt("order_id"));
				order.setProductName(productName);
				order.setProductId(productId);
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return order;
	}
	
	@Override
	public List<Order> selectAndFilterCustomerOrder(String cusName, String identity, int pageSize,
			int pageNum) {
		List<Order> orders = new ArrayList<Order>();
		StringBuffer sbf = new StringBuffer("");
		sbf.append("  select c.customer_id,customer_name,product_id,order_id,order_amount,buying_price,total_price,receiver_name,order_status  from  customer c right join `order` o on c.customer_id=o.customer_id where 1=1 and o.order_status=7 and o.type=0 and TimeStampDiff(day,o.finish_date,NOW())<15 ");
		if(cusName != null && !"".equals(cusName)){
			sbf.append(" and customer_name=? ");
		}
		if(identity != null && !"".equals(identity)){
			sbf.append(" and identity=? ");
		}
		sbf.append(" limit " + ((pageNum - 1) * pageSize) + "," + pageSize*pageNum);
		try {
			PreparedStatement ps = connection.prepareStatement(sbf.toString());
			int index=1;
			if(cusName != null && !"".equals(cusName)){
				ps.setString(index, cusName);
				index++;
			}
			if(identity != null && !"".equals(identity)){
				ps.setString(index, identity);
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int productId = rs.getInt("product_id");
				PreparedStatement newPs = (PreparedStatement) connection.prepareStatement("select * from product where product_id = ?");
				newPs.setInt(1, productId);
				ResultSet newRs = newPs.executeQuery();
				Order order = new Order();
				int cusId = rs.getInt("customer_id");
				Customer cus = CustomerService.getInstance().getCustomerById(cusId);
				order.setId(rs.getInt("order_id"));
				if(newRs.next()){
					order.setProductName(newRs.getString("product_name"));
				}
				order.setProductId(productId);
				order.setAmount(rs.getInt("order_amount"));
				order.setBuyingPrice(rs.getDouble("buying_price"));
				order.setTotalPrice(rs.getDouble("total_price"));
				order.setRcvName(rs.getString("receiver_name"));
				order.setCustomer(cus);
				order.setCustomerName(rs.getString("customer_name"));
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
	public void generateReturnOrder(ReturnOrder rOrder,Order order){
		PreparedStatement ps = null;
		PreparedStatement newps = null;
		PreparedStatement secondPs = null;
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int dateyear = year%100;
		int datemonth = calendar.get(Calendar.MONTH);
		int datedate = calendar.get(Calendar.DATE);
		String dateString = ""+dateyear+datemonth+datedate;
		String rdm = DBUtil.getFourRandom();
		String idString = dateString+rdm;
		int returnId = Integer.valueOf(idString).intValue();
	
		rOrder.setOrder(order);
		rOrder.setProduct(order.getProduct());
		rOrder.setReturnAmount(order.getAmount());
		try {
			ps = (PreparedStatement) connection.prepareStatement("insert into `return` values (?,?,null,?,?,?,?,?)");
			ps.setInt(1, returnId);
			ps.setInt(2, order.getId());
//			ps.setTimestamp(2, rOrder.getReturnDate());
			ps.setTimestamp(3, rOrder.getFinishDate());
			ps.setInt(4, rOrder.getReturnAmount());
			ps.setInt(5, rOrder.getReturnReason());
			ps.setInt(6, 002);
			ps.setDate(7, null);
			ps.executeUpdate();
			
			secondPs = connection.prepareStatement("select return_date from `return` where return_id=?");
			secondPs.setInt(1, returnId);
			
			newps = connection.prepareStatement("update `order` SET order_status= 1,type= 1 where order_id=?");
			newps.setInt(1, order.getId());
			newps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closePS(ps);
			DBUtil.closePS(newps);
		}
		
		order.setType(OrderType.ReturnOrder);
		order.setStatus(OrderStatus.Allocatable);
	}
	
	@Override
	public int selectOrderPageCount(String cusName, String identity, int pageSize) {
		int count = 0;
		StringBuffer sbf = new StringBuffer("");
		sbf.append("  select count(order_id) cc  from  customer c right join `order` o on c.customer_id=o.customer_id where 1=1 ");
		if(cusName != null && !"".equals(cusName)){
			sbf.append(" and customer_name=? ");
		}
		if(identity != null && !"".equals(identity)){
			sbf.append(" and identity=? ");
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
	public List<ReturnOrder> getAllReturn(){
		List<ReturnOrder> list = new ArrayList<>();
		PreparedStatement pStatement = null;
		try {
			pStatement = connection.prepareStatement("select * from `return`");
			ResultSet rSet = pStatement.executeQuery();
			while (rSet.next()) {
				ReturnOrder rOrder = new ReturnOrder();
				rOrder.setReturnId(rSet.getInt("rorder_id"));
				int orderId = rSet.getInt("order_id");
				Order order = getOrderById(orderId);
				rOrder.setOrder(order);
				rOrder.setReturnDate(rSet.getTimestamp("return_date"));
				rOrder.setFinishDate(rSet.getTimestamp("finish_date"));
				rOrder.setOrderId(orderId);
				rOrder.setReturnAmount(order.getAmount());
				rOrder.setReturnAmount(rSet.getInt("return_amount"));
				rOrder.setProduct(order.getProduct());
				rOrder.setReturnReason(rSet.getInt("return_reason"));
				rOrder.setProductName(order.getProductName());
				rOrder.setProductPrice(order.getBuyingPrice());
				list.add(rOrder);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

}
