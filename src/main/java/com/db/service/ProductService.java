package com.db.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.db.model.BrandVO;
import com.db.model.ProductVO;

public interface ProductService {

	// 메인 브랜드 리스트
	public ArrayList<BrandVO> brandList() throws Exception;

	// 브랜드 상품 리스트
	public ArrayList<ProductVO> brandProductList(String bname) throws Exception;

	// 브랜드 카테고리 상의 리스트
	public ArrayList<ProductVO> brandCateGoriesTopList(String bname) throws Exception;

	// 브랜드 카테고리 하의 리스트
	public ArrayList<ProductVO> brandCateGoriesBottomList(String bname) throws Exception;

	// 브랜드 카테고리 잡화 리스트
	public ArrayList<ProductVO> brandCateGoriesBoutiList(String bname) throws Exception;

	// 상품 검색
	public ArrayList<ProductVO> searchProduct(String pname) throws Exception;
	
	// 상품 상세
	public ProductVO productDetail(int num) throws Exception;
	
	// 상품 사이즈 리스트
	public List<ProductVO> productSizeList(String pname) throws Exception;

}
