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
 * Servlet implementation class CustomerManageServlet
 */
public class CustomerManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerManageServlet() {
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
		
		CustomerService service = CustomerService.getInstance();
		String action = request.getParameter("action");
		switch (action) {// 由于进入servlet的方式不同，因此获取参数的方式也不同。
		case "tab":// 说明是通过点击左侧tab进入该servlet
			tabAction(request, response, service);
			break;
		case "search":// 说明是通过点击查询按钮进入改servlet
			searchAction(request, response, service);
			break;
		case "pagenum":// 说明是通过点击分页码进入改servlet
			pagenumAction(request, response, service);
			break;
		default:
			break;

		}
//		if(action=="tab"){
//			tabAction(request, response, service);
//		}
//		if(action=="search"){
//			searchAction(request, response, service);
//		}
//		if(action=="pagenum"){
//			pagenumAction(request, response, service);
//		}
	}
	
	private void tabAction(HttpServletRequest request, HttpServletResponse response, CustomerService service) throws ServletException, IOException {
		List<Customer> list =  CustomerService.getInstance().selectCustomer(null,null,0,30,1);
		
//		int pageCount = service.selectPageCount(null, null, 5);
		request.getSession().setAttribute("cusName", null);
		request.getSession().setAttribute("identity", null);
		request.getSession().setAttribute("cusStatus", "all");
//		request.getSession().setAttribute("pageSize", 5);
//		request.getSession().setAttribute("pageCount", pageCount);
//		request.getSession().setAttribute("s_pageNum", 1);
		request.setAttribute("resultList", list);
		request.getRequestDispatcher("SelectCustomerInfo.jsp").forward(request, response);
	}

	private void searchAction(HttpServletRequest request, HttpServletResponse response, CustomerService service)
			throws  ServletException, IOException {
		// TODO Auto-generated method stub
		String cusName ="";
		String identity = "";
		String status = "";
		String pageSize  = "";
		cusName = "" +request.getParameter("cusName");
		identity = "" +request.getParameter("identity");
		status = "" +request.getParameter("cusStatus");
		pageSize = "" +request.getParameter("pageSize");
		
		int cusStatus = 3;
		if(status != null && !"all".equals(status) && !"null".equals(status)){
			if(status=="hasOrder"){
				cusStatus=2;
			}
			if(status=="noOrder"){
				cusStatus=1;
			}
			if(status=="deleted"){
				cusStatus=0;
			}
		}
		
		int pagesize=1;
		if(!pageSize.equals("") && pageSize != null&&!pageSize.equals("null")){
			pagesize = Integer.parseInt(pageSize);
			}
		
		List<Customer> list =  CustomerService.getInstance().selectCustomer(cusName, identity,cusStatus,pagesize,1);
		
		int pagecount =  CustomerService.getInstance().selectPageCount(cusName, identity,Integer.parseInt(pageSize));
		
		request.setAttribute("resultList", list);
		request.getSession().setAttribute("pagecount", pagecount);
		request.getSession().setAttribute("pageNum", 1);
		request.getSession().setAttribute("cusName", cusName);
		request.getSession().setAttribute("identity", identity);
		request.getSession().setAttribute("cusStatus", status);
		request.getSession().setAttribute("pageSize", pageSize);

		request.getRequestDispatcher("SelectCustomerInfo.jsp").forward(request, response);
	}

	private void pagenumAction(HttpServletRequest request, HttpServletResponse response, CustomerService service) throws  ServletException, IOException {
		// TODO Auto-generated method stub
		String pagenum = request.getParameter("pageNum");
		int pageNum = 1;
		String cusName ="";
		String identity = "";
		String status = "";
		String pageSize  = "";
		
		pageNum = Integer.parseInt(pagenum);
		cusName = "" +(String) request.getSession().getAttribute("cusName");
		identity = "" +(String) request.getSession().getAttribute("identity");
		status = "" +(String)request.getSession().getAttribute("cusStatus");
		pageSize = (String) request.getSession().getAttribute("pageSize");
		
		int cusStatus = 3;
		if(status != null && !"all".equals(status) && !"null".equals(status)){
			if(status=="hasOrder"){
				cusStatus=2;
			}
			if(status=="noOrder"){
				cusStatus=1;
			}
			if(status=="deleted"){
				cusStatus=0;
			}
		}
		
		int pagesize=1;
		if(!pageSize.equals("") && pageSize != null&&!pageSize.equals("null")){
			pagesize = Integer.parseInt(pageSize);
		}
		
		List<Customer> list =  CustomerService.getInstance().selectCustomer(cusName, identity,cusStatus,pagesize,pageNum);
		
		request.getSession().setAttribute("pageNum", pageNum);
		request.setAttribute("resultList", list);

		request.getRequestDispatcher("SelectCustomerInfo.jsp").forward(request, response);
	}
		
}
