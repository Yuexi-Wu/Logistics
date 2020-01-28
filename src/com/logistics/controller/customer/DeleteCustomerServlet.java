package com.logistics.controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logistics.model.service.CustomerService;

/**
 * Servlet implementation class DeleteCustomerServlet
 */
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomerServlet() {
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
		if("delete".equals(action)){
			String cusId = request.getParameter("cusId");
			CustomerService.getInstance().deleteCustomer(Integer.parseInt(cusId));
			int pageNum = (Integer) request.getSession().getAttribute("pageNum");
			try {
				response.sendRedirect(request.getContextPath()+"/customerManageServlet?action=search&pageNum="+pageNum);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
