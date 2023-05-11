package com.db.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.ProductMapper;
import com.db.model.BrandVO;
import com.db.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductMapper productmapper;
	
	@Override
	public ArrayList<BrandVO> brandList() throws Exception {
		
		return productmapper.brandList();
	}

	@Override
	public ArrayList<ProductVO> brandProductList(String bname) throws Exception {
		
		return productmapper.brandProductList(bname);
	}

}
