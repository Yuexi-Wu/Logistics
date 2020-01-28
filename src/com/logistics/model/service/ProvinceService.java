package com.logistics.model.service;

import java.sql.Connection;
import java.util.List;

import com.logistics.model.dao.province.ProvinceDAO;
import com.logistics.model.dao.province.ProvinceDAOImp;
import com.logistics.model.po.City;
import com.logistics.model.po.Province;
import com.logistics.utils.DBUtil;

public class ProvinceService {
	
	public ProvinceService(){
		
	}
	
	private static ProvinceService service = new ProvinceService();
	
	public static ProvinceService getInstance(){
		return service;
	}
	
	public List<Province> getAllProvince(){
		Connection connection = DBUtil.getConn(); 
		ProvinceDAO dao = new ProvinceDAOImp(connection);
		return dao.getAllProvince();
	}
	
	public List<City> getAllCityByProvince(int provinceId){
		Connection connection = DBUtil.getConn(); 
		ProvinceDAO dao = new ProvinceDAOImp(connection);
		return dao.getAllCityByProvince(provinceId);
	}
	
	public Province getProvinceById(int provinceId){
		Connection connection = DBUtil.getConn(); 
		ProvinceDAO dao = new ProvinceDAOImp(connection);
		return dao.getProvinceById(provinceId);
	}
	
	public City getCityById(int cityId){
		Connection connection = DBUtil.getConn(); 
		ProvinceDAO dao = new ProvinceDAOImp(connection);
		return dao.getCityById(cityId);
	}
	
}
