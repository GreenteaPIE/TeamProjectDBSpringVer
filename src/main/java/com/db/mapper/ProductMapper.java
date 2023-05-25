package com.db.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.CartVO;
import com.db.model.OrderVO;
import com.db.model.ProductVO;

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

	// 제품 이름으로 제품 불러오기
	public ProductVO productDetailByPname(String name);

	// 옥션 목록 가져오기
	public ArrayList<AuctionVO> getAuctionList();

	// 옥션 상세 보기
	public AuctionVO getAuctionDetail(int num);

	// 경매 입찰
	public void dealAuction(AuctionVO auVo);

	// 기간이 지난 경매(onOff설정)
	public void endAuction(int num);

	// 결제 정보 추가(orders table)
	public void addOrders(String userid);

	// order detail 테이블에 추가
	public void addOrderDetail(@Param("cart") CartVO cart, @Param("totalprice") int totalprice,
			@Param("ordernumber") int ordernumber, @Param("name") String name, @Param("phone") String phone,
			@Param("email") String email, @Param("address1") String address1, @Param("address2") String address2,
			@Param("address3") String address3);

	// orders table에 추가된 ordernumber 값 가져오기
	public int getLatestOrderNumber(String userid);

	// order_view 에서 정보 가져오기
	public ArrayList<OrderVO> getOrderList(int orderNumber);

	// 주문완료한 장바구니 result -> 0 으로 변경
	public int cartResultChange(@Param("cartnum") int cartnum, @Param("cart") CartVO cart);

	// 사용한 쿠폰 result -> 0 으로 변경
	public int useCoupon(@Param("cnum") int cnum);

	// 주문완료 후 포인트 지급
	void increaseUserPoint(Map<String, Object> params);

}
