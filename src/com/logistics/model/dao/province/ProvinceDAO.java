package com.logistics.model.dao.province;

import java.util.List;

import com.logistics.model.po.City;
import com.logistics.model.po.Province;

public interface ProvinceDAO {

	List<Province> getAllProvince();

	List<City> getAllCityByProvince(int provinceId);

	Province getProvinceById(int provinceId);

	City getCityById(int cityId);

}
