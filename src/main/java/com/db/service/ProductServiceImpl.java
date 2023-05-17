package com.db.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.ProductMapper;
import com.db.model.BrandVO;
import com.db.model.CartVO;
import com.db.model.ProductVO;
import com.db.model.UserVO;

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
	public CartVO addOrders(String userid) throws Exception {
		
		return productmapper.addOrders(userid);
	}

}
