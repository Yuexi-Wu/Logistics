package com.logistics.controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logistics.model.po.Customer;
import com.logistics.model.service.CustomerService;

/**
 * Servlet implementation class EditCustomerServlet
 */
public class EditCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCustomerServlet() {
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
		
		String action = request.getParameter("action");
		if("edit".equals(action)){
			doEditUser(request,response);
		}else if("update".equals(action)){
			doUpdateUser(request,response);
		}else if("jump".equals(action)){
			doJump(request, response);
		}
	}
	
	private void doJump(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.getRequestDispatcher("/SelectCustomerInfo.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doUpdateUser(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("cusId");
		String cusName = request.getParameter("cusName");
		String identity = request.getParameter("identity");
		String telephone = request.getParameter("telephone");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String adProvince = request.getParameter("adProvince");
		String adCity = request.getParameter("adCity");
		String adDetail = request.getParameter("adDetail");
		Customer customer = new Customer();
		customer.setCustomerId(Integer.parseInt(id));
		customer.setCustomerName(cusName);
		customer.setGender(gender);
		customer.setIdentity(identity);
		customer.setTelephone(telephone);
		customer.setEmail(email);
		customer.setAdProvince(adProvince);
		customer.setAdCity(adCity);
		customer.setAdDetail(adDetail);
		customer.setPostcode(Integer.parseInt(postcode));
		CustomerService.getInstance().updateCustomer(customer);
		int pageNum = (Integer) request.getSession().getAttribute("pageNum");
		try {
			response.sendRedirect(request.getContextPath()+"/customerManageServlet?pageNum="+pageNum);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doEditUser(HttpServletRequest request, HttpServletResponse response) {
		String cusId = request.getParameter("cusId");
		Customer customer = CustomerService.getInstance().getCustomerById(Integer.parseInt(cusId));
		
		request.setAttribute("editCustomer", customer);
		try {
			request.getRequestDispatcher("/EditCustomerInfo.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
