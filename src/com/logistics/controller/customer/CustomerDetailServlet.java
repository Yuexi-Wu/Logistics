package com.logistics.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logistics.model.po.Customer;
import com.logistics.model.service.CustomerService;

/**
 * Servlet implementation class CustomerDetailServlet
 */
public class CustomerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cusId = request.getParameter("cusId");
		
		CustomerService service = CustomerService.getInstance();

		Customer customer = service.getCustomerById(Integer.parseInt(cusId));
		String cusName = customer.getCustomerName();
		String cusIdentity = customer.getIdentity();
		int status = customer.getCusStatus();
		List<Customer> list = service.selectCustomer(cusName, cusIdentity, status);
		
		request.setAttribute("resultList", list);
		request.getRequestDispatcher("CustomerDetail.jsp").forward(request, response);
	
	}
	
}
