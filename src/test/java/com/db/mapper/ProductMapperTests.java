package com.db.mapper;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.db.model.BrandVO;

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
	*/
	@Test
	public void brandCateGoriesList() throws Exception{
		
		String bname="prada";
	
		productmapper.brandCateGoriesBoutiList(bname);
	}
}

