package com.db.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.ProductMapper;
import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.CartVO;
import com.db.model.OrderVO;
import com.db.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

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

	@Override
	public ArrayList<ProductVO> brandCateGoriesTopList(String bname) throws Exception {

		return productmapper.brandCateGoriesTopList(bname);
	}

	@Override
	public ArrayList<ProductVO> brandCateGoriesBottomList(String bname) throws Exception {

		return productmapper.brandCateGoriesBottomList(bname);
	}

	@Override
	public ArrayList<ProductVO> brandCateGoriesBoutiList(String bname) throws Exception {

		return productmapper.brandCateGoriesBoutiList(bname);
	}

	@Override
	public ArrayList<ProductVO> searchProduct(String pname) throws Exception {

		return productmapper.searchProduct(pname);
	}

	@Override
	public ProductVO productDetail(int num) {

		return productmapper.productDetail(num);
	}

	@Override
	public List<ProductVO> productSizeList(String pname) throws Exception {

		return productmapper.productSizeList(pname);
	}

	@Override
	public CartVO addCart(CartVO cart) throws Exception {

		return productmapper.addCart(cart);

	}

	@Override
	public ArrayList<CartVO> getCartList(String userid) throws Exception {

		return productmapper.getCartList(userid);
	}

	@Override
	public ArrayList<ProductVO> getAllProduct() throws Exception {

		return productmapper.getAllProduct();
	}

	@Override
	public int countCart(String userid) throws Exception {

		return productmapper.countCart(userid);
	}

	@Override
	public ArrayList<ProductVO> getAllProductNoDup() throws Exception {

		return productmapper.getAllProductNoDup();
	}

	@Override
	public CartVO findByCartNum(int cartnum) throws Exception {

		return productmapper.findByCartNum(cartnum);
	}

	@Override
	public int decreaseQuantity(int cartnum) throws Exception {

		return productmapper.decreaseQuantity(cartnum);
	}

	@Override
	public int increaseQuantity(int cartnum) throws Exception {

		return productmapper.increaseQuantity(cartnum);
	}

	@Override
	public int cartDelete(int cartnum) throws Exception {

		return productmapper.cartDelete(cartnum);
	}

	@Override
	public void addOrders(String userid) throws Exception {

		productmapper.addOrders(userid);
	}

	@Override
	public void addOrderDetail(CartVO cart, int totalprice, int ordernumber, String name, String phone, String email,
			String address1, String address2, String address3) throws Exception {
		productmapper.addOrderDetail(cart, totalprice, ordernumber, name, phone, email, address1, address2, address3);
	}

	@Override
	public int getLatestOrderNumber(String userid) throws Exception {
		productmapper.addOrders(userid);
		// 새로 생성된 주문 번호(orderNumber)를 반환합니다.
		return productmapper.getLatestOrderNumber(userid);
	}

	@Override
	public ArrayList<OrderVO> getOrderList(int orderNumber) throws Exception {
	
		return productmapper.getOrderList(orderNumber);
	}

	@Override
	public int cartResultChange(@Param("cartnum") int cartnum,@Param("cart") CartVO cart) throws Exception {
		
		return productmapper.cartResultChange(cartnum, cart);
	}

	@Override
	public int useCoupon(int cnum) throws Exception {
		
		return productmapper.useCoupon(cnum);
	}

	@Override
	public void increaseUserPoint(String userid, int totalprice) throws Exception {
	    Map<String, Object> params = new HashMap<>();
	    params.put("userid", userid);
	    params.put("totalprice", totalprice);
	    
	    productmapper.increaseUserPoint(params);
	}

    @Override
    public ProductVO productDetailByPname(String pname) throws Exception {
        return productmapper.productDetailByPname(pname);
    }

	@Override
	public ArrayList<AuctionVO> getAuctionList() throws Exception {
		return productmapper.getAuctionList();
	}

	@Override
	public AuctionVO getAuctionDetail(int num) throws Exception {
		return productmapper.getAuctionDetail(num);
	}

	@Override
	public void dealAuction(AuctionVO auVo) throws Exception {
		productmapper.dealAuction(auVo);
	}

	@Override
	public void endAuction(int num) throws Exception {
		productmapper.endAuction(num);
	}

}
