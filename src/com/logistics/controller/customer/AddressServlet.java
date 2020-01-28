package com.logistics.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.logistics.model.po.City;
import com.logistics.model.po.Province;
import com.logistics.model.service.ProvinceService;

/**
 * Servlet implementation class AddressServlet
 */
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		if(action==null){
			System.out.println("null!");
		}
		if(action.equals("getProvince")){
			doGetProvince(request, response);
		}
		if(action.equals("getCity")){
			doGetCity(request, response);
		}
	}
	
	private void doGetProvince(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gs = new Gson();
		List<Province> list =new ArrayList<Province>();
		list = ProvinceService.getInstance().getAllProvince();
		response.setContentType("text/html;charset=utf-8");
		String listStr = gs.toJson(list);
		System.out.println(listStr);
		response.getWriter().print(listStr);
	}
	
	private void doGetCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adProvince = request.getParameter("adProvince");
		int provinceId = 0;
		if (adProvince != null & !adProvince.equals("")) {
			provinceId = Integer.parseInt(adProvince);
		}
		Gson gs = new Gson();
		List<City> list =new ArrayList<>();
		list=ProvinceService.getInstance().getAllCityByProvince(provinceId);
		response.setContentType("text/html;charset=utf-8");
		String listStr = gs.toJson(list);
		System.out.println(listStr);
		response.getWriter().print(listStr);
	}

}
