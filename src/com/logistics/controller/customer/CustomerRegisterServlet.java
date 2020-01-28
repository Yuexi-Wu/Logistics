package com.logistics.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logistics.model.po.Customer;
import com.logistics.model.service.CustomerService;
import com.logistics.model.service.ProvinceService;

/**
 * Servlet implementation class CustomerRegisterServlet
 */
public class CustomerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegisterServlet() {
        super();
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
		response.setContentType("text/html;charset=utf-8");
		
		
		String action = request.getParameter("action");
		if("validate".equals(action)){
			String cusName = request.getParameter("cusName");
			boolean flag = CustomerService.getInstance().validateCustomerName(cusName);
			response.setContentType("text/html");
			PrintWriter pWriter = response.getWriter();
			pWriter.print(flag);
			pWriter.close();
		}if("registration".equals(action)){
			request.getRequestDispatcher("/CustomerRegister.jsp").forward(request, response);
		}else{
			String cusName=request.getParameter("cusName");
			String gender=request.getParameter("gender");
			String identity=request.getParameter("identity");
			String email=request.getParameter("email");
			String telephone=request.getParameter("telephone");
			String adProvince = request.getParameter("adProvince");
			int provinceId = 0;
			if(!adProvince.equals("") && adProvince != null){
				provinceId = Integer.parseInt(adProvince);
			}
			String provinceName =ProvinceService.getInstance().getProvinceById(provinceId).getProvinceName();
			String adCity = request.getParameter("adCity");
			int cityId = 0;
			if(!adProvince.equals("") && adProvince != null){
				cityId = Integer.parseInt(adCity);
			}
			String cityName =ProvinceService.getInstance().getCityById(cityId).getCityName();
			String adDetail = request.getParameter("adDetail");
			String postcodes = request.getParameter("postcode");
			int postcode=0;
			if(!postcodes.equals("") && postcodes != null){
				postcode = Integer.parseInt(postcodes);
				}
			Customer customer = new Customer();
			customer.setCustomerName(cusName);
			customer.setGender(gender);
			customer.setIdentity(identity);
			customer.setTelephone(telephone);
			customer.setEmail(email);
			customer.setAdProvince(provinceName);
			customer.setAdCity(cityName);
			customer.setAdDetail(adDetail);
			customer.setPostcode(postcode);
			customer.setCusStatus(1);

			CustomerService.getInstance().register(customer);
			request.getRequestDispatcher("customerManageServlet?action=tab").forward(request, response);
		}
	}
}
