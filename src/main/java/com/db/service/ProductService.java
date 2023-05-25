package com.db.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.CartVO;
import com.db.model.OrderVO;
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

	// 장바구니 상품 추가
	public CartVO addCart(CartVO cart) throws Exception;

	// 장바구니 리스트 불러오기
	public ArrayList<CartVO> getCartList(String userid) throws Exception;

	// 모든 상품 정보 불러오기
	public ArrayList<ProductVO> getAllProduct() throws Exception;

	// 장바구니 상품 갯수 불러오기
	public int countCart(String userid) throws Exception;

	// 모든 상품을 중복 없이 불러오기
	public ArrayList<ProductVO> getAllProductNoDup() throws Exception;

	// 장바구니안의 장바구니num으로 정보 불러오기
	public CartVO findByCartNum(int cartnum) throws Exception;

	// 장바구니 수량 감소
	public int decreaseQuantity(int cartnum) throws Exception;

	// 장바구니 수량 증가
	public int increaseQuantity(int cartnum) throws Exception;

	// 장바구니 상품 삭제
	public int cartDelete(int cartnum) throws Exception;

	// 결제 정보 추가(orders table)
	public void addOrders(String userid) throws Exception;

	// order detail 테이블에 추가
	public void addOrderDetail(CartVO cart, int totalprice, int ordernumber, String name, String phone, String email,
			String address1, String address2, String address3) throws Exception;

	// orders table에 추가된 ordernumber 값 가져오기
	public int getLatestOrderNumber(String userid) throws Exception;

	// order_view 에서 정보 가져오기
	public ArrayList<OrderVO> getOrderList(int orderNumber) throws Exception;

	// 주문완료한 장바구니 result ->0 으로 변경
	public int cartResultChange(@Param("cartnum") int cartnum, @Param("cart") CartVO cart) throws Exception;

	// 사용한 쿠폰 result -> 0 으로 변경
	public int useCoupon(int cnum) throws Exception;

	// 주문완료 후 포인트 지급
	public void increaseUserPoint(String userid, int totalprice) throws Exception;

	// 상품 상세(제품 이름으로 검색
	public ProductVO productDetailByPname(String pname) throws Exception;

	// 옥션 목록 가져오기
	public ArrayList<AuctionVO> getAuctionList() throws Exception;

	// 옥션 상세 보기
	public AuctionVO getAuctionDetail(int num) throws Exception;

	// 경매 입찰
	public void dealAuction(AuctionVO auVo) throws Exception;

	// 기간이 지난 경매(onOff설정)
	public void endAuction(int num) throws Exception;

}
