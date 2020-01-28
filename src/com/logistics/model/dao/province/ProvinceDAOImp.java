package com.logistics.model.dao.province;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.logistics.model.po.City;
import com.logistics.model.po.Province;

public class ProvinceDAOImp implements ProvinceDAO{
	Connection connection;
	
	public ProvinceDAOImp(Connection connection){
		this.connection = connection;
	}
	
	@Override
	public List<Province> getAllProvince(){
		List<Province> list = new ArrayList<Province>();
		PreparedStatement pStatement = null;
		try {
			pStatement = connection.prepareStatement("select * from city where city.parent_id=0;");
			ResultSet rSet = pStatement.executeQuery();
			while(rSet.next()){
				String provinceName = rSet.getString("name");
				int provinceId = rSet.getInt("sort");
				Province province = new Province();
				province.setProvinceId(provinceId);
				province.setProvinceName(provinceName);
				list.add(province);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<City> getAllCityByProvince(int provinceId){
		List<City> list = new ArrayList<City>();
		PreparedStatement pStatement = null;
		try {
			pStatement = connection.prepareStatement("select * from city where city.sort = ? and city.parent_id <> 0;");
			pStatement.setInt(1, provinceId);
			ResultSet rSet = pStatement.executeQuery();
			while(rSet.next()){
					String cityName = rSet.getString("name");
					int cityId = rSet.getInt("id");
					City city = new City();
					city.setCityId(cityId);
					city.setCityName(cityName);
					list.add(city);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;		
	}
	
	@Override
	public Province getProvinceById(int provinceId){
		Province province = new Province();
		PreparedStatement pStatement = null;
		try {
			pStatement = connection.prepareStatement("select * from city where sort=? and parent_id=0");
			pStatement.setInt(1, provinceId);
			ResultSet rSet = pStatement.executeQuery();
			if(rSet.next()){
				province.setProvinceId(provinceId);
				province.setProvinceName(rSet.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return province;
	}
	
	@Override
	public City getCityById(int cityId){
		City city = new City();
		PreparedStatement pStatement = null;
		try {
			pStatement = connection.prepareStatement("select * from city where id=?");
			pStatement.setInt(1, cityId);
			ResultSet rSet = pStatement.executeQuery();
			if(rSet.next()){
				city.setCityId(cityId);
				city.setCityId(cityId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return city;
	}

}
