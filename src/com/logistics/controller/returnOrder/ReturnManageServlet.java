package com.logistics.controller.returnOrder;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logistics.model.po.Order;
import com.logistics.model.service.OrderService;

/**
 * Servlet implementation class ReturnManageServlet
 */
public class ReturnManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnManageServlet() {
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
		if("all".equals(action)){
			allOrder(request, response);
		}
		if("filter".equals(action)){
			filterOrder(request,response);
		}
		if("tab".equals(action)){
			tabOrder(request,response);
		}
	}
	
	private void tabOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Order> list = OrderService.getInstance().selectPageCustomerOrder(null, null, 5, 1);
		int pageCount = OrderService.getInstance().selectOrderPageCount(null, null, 5);
		request.setAttribute("orderList", list);
		request.setAttribute("pagecount", pageCount);
		request.getSession().setAttribute("pageNum", 1);
		request.getSession().setAttribute("cusName", null);
		request.getSession().setAttribute("identity", null);
		request.getSession().setAttribute("pageSize", 5);
		request.getRequestDispatcher("ViewCustomerOrder.jsp").forward(request, response);
	}
	
	protected void allOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pagenum = request.getParameter("pageNum");
		int pageNum = 1;
		String cusName ="";
		String identity = "";
		String pageSize  = "";
		if(pagenum != null && !"".equals(pagenum)){
			pageNum = Integer.parseInt(pagenum);
			cusName = (String) request.getSession().getAttribute("cusName");
			identity = (String) request.getSession().getAttribute("identity");
//			orderType = (String) request.getSession().getAttribute("orderType");
			pageSize = (String) request.getSession().getAttribute("pageSize");
		}else{
			cusName = request.getParameter("cusName");
			identity = request.getParameter("identity");
//			orderType = request.getParameter("orderType");
			pageSize = request.getParameter("pageSize");
		}
		List<Order> list = OrderService.getInstance().selectPageCustomerOrder(cusName, identity, Integer.parseInt(pageSize), pageNum);
		int pagecount =  OrderService.getInstance().selectOrderPageCount(cusName, identity,Integer.parseInt(pageSize));

		request.setAttribute("orderList", list);
		request.setAttribute("pagecount", pagecount);
		request.getSession().setAttribute("pageNum", pageNum);
		request.getSession().setAttribute("cusName", cusName);
		request.getSession().setAttribute("identity", identity);
		request.getSession().setAttribute("pageSize", pageSize);
		request.getRequestDispatcher("ViewCustomerOrder.jsp").forward(request, response);
	}
	
	protected void filterOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pagenum = request.getParameter("pageNum");
		int pageNum = 1;
		String cusName ="";
		String identity = "";
		String pageSize  = "";
		if(pagenum != null && !"".equals(pagenum)){
			pageNum = Integer.parseInt(pagenum);
			cusName = (String) request.getSession().getAttribute("cusName");
			identity = (String) request.getSession().getAttribute("identity");
			pageSize = (String) request.getSession().getAttribute("pageSize");
		}else{
			cusName = request.getParameter("cusName");
			identity = request.getParameter("identity");
			pageSize = request.getParameter("pageSize");
		}
		
		List<Order> list =  OrderService.getInstance().selectAndFilterPageCustomerOrder(cusName, identity, Integer.parseInt(pageSize), pageNum);
		int pagecount =  OrderService.getInstance().selectOrderPageCount(cusName, identity,Integer.parseInt(pageSize));

		
		request.setAttribute("orderList", list);
		request.setAttribute("pagecount", pagecount);
		request.getSession().setAttribute("pageNum", pageNum);
		request.getSession().setAttribute("cusName", cusName);
		request.getSession().setAttribute("identity", identity);
		request.getSession().setAttribute("pageSize", pageSize);
		
		request.getRequestDispatcher("SelectReturnOrder.jsp").forward(request, response);
	}
		
}
