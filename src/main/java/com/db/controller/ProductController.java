package com.db.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.model.CartVO;
import com.db.model.ProductVO;
import com.db.model.UserVO;
import com.db.service.ProductService;

@Controller
@RequestMapping(value = "/product")
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
			request.setAttribute("bplist", bplist); // 브랜드명으로 상품을 불러옴
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	// 브랜드 상의 상품 리스트
	@GetMapping("/brandTopList")
	public String brandTopListGET(String bname, HttpServletRequest request, RedirectAttributes rttr) {

		request.setAttribute("bname", bname);

		try {
			ArrayList<ProductVO> bplist = productService.brandCateGoriesTopList(bname);
			request.setAttribute("bplist", bplist);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/product/brandProductList";

	}

	// 브랜드 하의 상품 리스트
	@GetMapping("/brandBottomList")
	public String brandBottomListGET(String bname, HttpServletRequest request, RedirectAttributes rttr) {

		request.setAttribute("bname", bname);

		try {
			ArrayList<ProductVO> bplist = productService.brandCateGoriesBottomList(bname);
			request.setAttribute("bplist", bplist);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/product/brandProductList";
	}

	// 브랜드 잡화 상품 리스트
	@GetMapping("/brandBoutiList")
	public String brandBoutiListGET(String bname, HttpServletRequest request, RedirectAttributes rttr) {

		request.setAttribute("bname", bname);

		try {
			ArrayList<ProductVO> bplist = productService.brandCateGoriesBoutiList(bname);
			request.setAttribute("bplist", bplist);

		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/product/brandProductList";

	}

	// 상품 검색
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

	// 상품 상세 보기
	@GetMapping("/productDetail")
	public String productDetailGET(int num, HttpServletRequest request) throws Exception {
		ProductVO pdlist = productService.productDetail(num);
		String pname = request.getParameter("pname");
		List<ProductVO> slist = productService.productSizeList(pname);

		request.setAttribute("ps", slist); // 상품 이름으로 존재하는 사이즈를 가져옴
		request.setAttribute("pdlist", pdlist); // 상품번호로 상품정보를 가져옴
		return "/product/productDetail";

	}

	// 장바구니 페이지 이동
	@GetMapping("/cart")
	public void cartGET(HttpServletRequest request) throws Exception {

		logger.info("장바구니 페이지 진입");
	}

	// 장바구니에 상품 추가 후 장바구니 리스트 가져오기
	@PostMapping("/addCart")
	public String addCartPOST(String userid, CartVO cart, HttpServletRequest request, HttpSession session)
			throws Exception {

		productService.addCart(cart); // 장바구니 추가 쿼리 실행

		ArrayList<CartVO> clist = productService.getCartList(userid); // userid로 장바구니 리스트 불러오기

		request.setAttribute("clist", clist);

		ArrayList<ProductVO> plist = productService.getAllProduct(); // 모든 상품 가져오기
		request.setAttribute("plist", plist);

		return "/product/cart";

	}

	// 나의 장바구니
	@GetMapping("/myCart")
	public String myCartGET(String userid, HttpServletRequest request, HttpSession session) throws Exception {

		ArrayList<CartVO> clist = productService.getCartList(userid); // userid로 장바구니 리스트 불러오기

		request.setAttribute("clist", clist);

		ArrayList<ProductVO> plist = productService.getAllProduct(); // 모든 상품 가져오기
		request.setAttribute("plist", plist);

		return "/product/cart";

	}

	// 장바구니 뱃지 상품 개수
	@GetMapping("/countCartAjax")
	@ResponseBody
	public String countCartAjax(String userid) throws Exception {
		return String.valueOf(productService.countCart(userid));
	}

}
