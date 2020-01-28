package com.logistics.controller.returnOrder;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logistics.model.po.ReturnOrder;
import com.logistics.model.service.OrderService;

/**
 * Servlet implementation class ReturnOrderServlet
 */
public class ReturnOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnOrderServlet() {
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
		String action=request.getParameter("action");
		OrderService service =OrderService.getInstance();
		switch (action) {// 由于进入servlet的方式不同，因此获取参数的方式也不同。
		case "tab":// 说明是通过点击左侧tab进入该servlet
			tabAction(request, response, service);
			break;
		case "check":// 说明是通过点击查询按钮进入改servlet
			checkAction(request, response, service);
			break;
		default:
			break;
		}
		
		
	}
	
	private void tabAction(HttpServletRequest request, HttpServletResponse response, OrderService service) throws ServletException, IOException {
		List<ReturnOrder> list = OrderService.getInstance().getAllReturn();
		request.setAttribute("returnList", list);
		request.getRequestDispatcher("CheckReturn.jsp").forward(request, response);
	}
	
	private void checkAction(HttpServletRequest request, HttpServletResponse response, OrderService service) throws ServletException, IOException {
		List<ReturnOrder> list = OrderService.getInstance().getAllReturn();
		request.setAttribute("returnList", list);
		request.getRequestDispatcher("CheckReturn.jsp").forward(request, response);
	}

}
