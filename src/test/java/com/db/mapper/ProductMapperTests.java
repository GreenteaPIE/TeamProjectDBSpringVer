package com.db.mapper;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.db.model.BrandVO;
import com.db.model.CartVO;
import com.db.model.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {
	
	@Autowired
	private ProductMapper productmapper;
	
	/*
	@Test
	public void brandList() throws Exception{
		productmapper.brandList();
	}
	
	@Test
	public void brandProductList() throws Exception{
		String bname = "hermes";
		productmapper.brandProductList(bname);
		
	}
	
	
	@Test
	public void brandCateGoriesList() throws Exception{
		
		String bname="prada";
	
		productmapper.brandCateGoriesTopList(bname);
	}
	

	
	@Test
	public void searchProductList() throws Exception{
		String pname = "pan";
		
		productmapper.searchProduct(pname);
	}
	
	@Test
	public void brandCateGoriesList() throws Exception{
		
		String bname="prada";
	
		productmapper.brandCateGoriesBoutiList(bname);
	}
	
	@Test
	public void productDetail() throws Exception{
		int num = 5;
		productmapper.productDetail(num);
	}
	
	@Test
	public void productSizeList() throws Exception{
		String pname = "Herbier 3D T-shirt";
		productmapper.productSizeList(pname);
	}
	
	
	
	@Test
	public void getCartList() throws Exception{
		String userid = "user";
		productmapper.getCartList(userid);
	}
	
	@Test
	public void addCart() throws Exception{
		CartVO cart = new CartVO();
		
		cart.setUserid("user");
		cart.setNum(2);
		cart.setPsize("s");
		cart.setQuantity(3);
		cart.setPrice(40000);
		productmapper.addCart(cart);
		System.out.println(cart);
	}

	@Test
	public void getProductByNum() throws Exception{
	
		productmapper.getAllProduct();
	}
	*/
	@Test
	public void countCart() throws Exception{
		String userid = "user";
		productmapper.countCart(userid);
	}
}
