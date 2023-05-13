package com.db.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.ProductMapper;
import com.db.model.BrandVO;
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

}
