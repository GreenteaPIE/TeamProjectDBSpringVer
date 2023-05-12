package com.db.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.model.ProductVO;
import com.db.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	ProductService productService;
	
	// 브랜드 상품 리스트 페이지 이동
	@GetMapping("brandProductList")
	public void brandProductListGET(String bname, HttpServletRequest request) {
		logger.info("브랜드 상품 리스트 페이지 진입");
		request.setAttribute("bname", bname);
	    
		try {
			ArrayList<ProductVO> bplist = productService.brandProductList(bname);
			request.setAttribute("bplist", bplist);
		} catch (Exception e) {
	
			e.printStackTrace();
		}

		
	}
	@GetMapping("/brandTopList")
	public void brandTopListGET(String bname, HttpServletRequest request, RedirectAttributes rttr) {
		
		request.setAttribute("bname", bname);
		
		try {
			ArrayList<ProductVO> bplist = productService.brandCateGoriesTopList(bname);
			request.setAttribute("bplist", bplist);
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		
	}
	@GetMapping("/brandBottomList")
	public void brandBottomListGET(String bname, HttpServletRequest request, RedirectAttributes rttr) {
		
		request.setAttribute("bname", bname);
		
		try {
			ArrayList<ProductVO> bplist = productService.brandCateGoriesBottomList(bname);
			request.setAttribute("bplist", bplist);
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		
	}
	@GetMapping("/brandBoutiList")
	public void brandBoutiListGET(String bname, HttpServletRequest request, RedirectAttributes rttr) {
		
		request.setAttribute("bname", bname);
		
		try {
			ArrayList<ProductVO> bplist = productService.brandCateGoriesBoutiList(bname);
			request.setAttribute("bplist", bplist);
			
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		
	}
	
	@GetMapping("/searchProduct")
	public String searchProductGET(String pname, HttpServletRequest request) {
	request.setAttribute("pname", pname);
	try {
	ArrayList<ProductVO> bplist = productService.searchProduct(pname);
	if (bplist == null || bplist.isEmpty()) {
	return "/product/searchNotFound";
	}
	request.setAttribute("bplist", bplist);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
}


}
