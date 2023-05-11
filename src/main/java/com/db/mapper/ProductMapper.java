package com.db.mapper;

import java.util.ArrayList;

import com.db.model.BrandVO;
import com.db.model.ProductVO;

public interface ProductMapper {
	
	//메인 브랜드 리스트
	public ArrayList<BrandVO> brandList();
	
	//브랜드 상품 리스트
	public ArrayList<ProductVO> brandProductList(String bname);

}
