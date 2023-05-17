package com.db.mapper;

import java.util.ArrayList;
import java.util.List;

import com.db.model.BrandVO;
import com.db.model.CartVO;
import com.db.model.OrderVO;
import com.db.model.ProductVO;
import com.db.model.UserVO;

public interface ProductMapper {

	// 메인페이지, 헤더 브랜드 리스트
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

	// 상품 상세
	public ProductVO productDetail(int num);

	// 상품 사이즈 리스트
	public List<ProductVO> productSizeList(String pname);

	// 장바구니 상품 추가
	public CartVO addCart(CartVO cart);

	// 장바구니 리스트 불러오기
	public ArrayList<CartVO> getCartList(String userid);

	// 모든 상품 정보 불러오기
	public ArrayList<ProductVO> getAllProduct();

	// 장바구니 상품 갯수 불러오기
	public int countCart(String userid);

	// 모든 상품을 중복 없이 불러오기
	public ArrayList<ProductVO> getAllProductNoDup();

	// 장바구니안의 장바구니num으로 정보 불러오기
	public CartVO findByCartNum(int cartnum);
	
	// 장바구니 수량 감소
	public int decreaseQuantity(int cartnum);
	
	// 장바구니 수량 증가
	public int increaseQuantity(int cartnum);
	
	// 장바구니 상품 삭제
	public int cartDelete(int cartnum);
	
	// 결제 정보 추가(orders table)
	public CartVO addOrders(String userid);

}
