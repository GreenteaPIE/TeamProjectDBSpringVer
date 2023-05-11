package com.db.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.db.model.BrandVO;
import com.db.model.ProductVO;

public interface ProductService {
	
	//메인 브랜드 리스트
	public ArrayList<BrandVO> brandList() throws Exception;
	
	//브랜드 상품 리스트
	public ArrayList<ProductVO> brandProductList(String bname) throws Exception;

}
