package com.db.mapper;

import java.util.ArrayList;

import com.db.model.BrandVO;
import com.db.model.ProductVO;

public interface ProductMapper {

	// 메인 브랜드 리스트
	public ArrayList<BrandVO> brandList();

	// 브랜드 상품 리스트
	public ArrayList<ProductVO> brandProductList(String bname);

	// 브랜드 카테고리 상의 리스트
	public ArrayList<ProductVO> brandCateGoriesTopList(String bname);

	// 브랜드 카테고리 하의 리스트
	public ArrayList<ProductVO> brandCateGoriesBottomList(String bname);

	// 브랜드 카테고리 잡화 리스트
	public ArrayList<ProductVO> brandCateGoriesBoutiList(String bname);
	
	// 상품 검색
	public ArrayList<ProductVO> searchProduct(String pname);

}
