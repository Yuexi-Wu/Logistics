package com.logistics.controller.returnOrder;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.logistics.model.po.Order;
import com.logistics.model.po.ReturnOrder;
import com.logistics.model.service.OrderService;

/**
 * Servlet implementation class EditReturnServlet
 */
public class EditReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReturnServlet() {
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
			doEditReturn(request,response);
		}else if("upload".equals(action)){
			try {
				doUploadReturn(request,response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void doUploadReturn(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, ParseException {
		String orderId = request.getParameter("id");
		Order order = OrderService.getInstance().getOrderById(Integer.parseInt(orderId));
		String finishDate = request.getParameter("finishDate");
		String returnReason = request.getParameter("returnReason");
		int reason=2;
		if(returnReason!=null && !"".equals(returnReason)){
			reason = Integer.parseInt(returnReason);
		}
		ReturnOrder rOrder = new ReturnOrder();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		if(returnReason!=null && !"".equals(returnReason)){
			timestamp = Timestamp.valueOf(finishDate);
		}
		rOrder.setOrderId(Integer.parseInt(orderId));
		rOrder.setFinishDate(timestamp);
		rOrder.setOrder(order);
		rOrder.setReturnReason(reason);
//		rOrder.setReturnAmount(Integer.parseInt(returnAmount));
		OrderService.getInstance().generateReturnOrder(rOrder, order);
//		int pageNum = (Integer) request.getSession().getAttribute("pageNum");
		List<ReturnOrder> list = OrderService.getInstance().getAllReturn();
		request.setAttribute("returnList", list);
		try {
			request.getRequestDispatcher("CheckReturn.jsp").forward(request, response);
//			response.sendRedirect(request.getContextPath()+"/CheckReturn.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doEditReturn(HttpServletRequest request, HttpServletResponse response) {
		String orderId = request.getParameter("orderId");
		Order order = OrderService.getInstance().getOrderById(Integer.parseInt(orderId));
		request.setAttribute("returnOrder", order);
		try {
			request.getRequestDispatcher("/EditReturn.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
