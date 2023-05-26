package com.db.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.OrderVO;
import com.db.model.ProductVO;
import com.db.model.UserVO;
import com.db.service.AdminService;
import com.db.service.ProductService;
import com.db.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@Autowired
	AdminService adminService;

	// 옥션 시작

	@GetMapping("auctionPage")
	public void AuctionPage() {
		System.out.println("auctionPage 접속");
	}

	@GetMapping("adminAuctionBrandList")
	public void AdminAuctionBrandListGET(Model model) throws Exception {
		System.out.println("adminAuctionBrandList 접속");
		ArrayList<BrandVO> list = productService.brandList();
		System.out.println("list: " + list);
		model.addAttribute("list", list);
	}

	@GetMapping("adminAuctionBrandProductList")
	public void AdminAuctionBrnadProductListGET(Model model, String bname) throws Exception {
		System.out.println("adminAuctionBrandProductList 접속");
		ArrayList<ProductVO> list = productService.brandProductList(bname);
		model.addAttribute("list", list);
	}

	@GetMapping("auctionBrandProductDetail")
	public void AuctionBrandProductDetailGET(String pname, String bname, Model model) throws Exception {
		System.out.println("auctionBrandProductDetail 접속");
		ProductVO pVo = productService.productDetailByPname(pname);
		List<ProductVO> sList = productService.productSizeList(pname);
		model.addAttribute("product", pVo);
		model.addAttribute("pSize", sList);
	}

	@PostMapping("addAuction.do")
	public String addAuctionPOST(AuctionVO vo, RedirectAttributes rttr, String dateTimeInput) throws Exception {

		vo.setPrice(vo.getStartPrice());
		Timestamp endTime = Timestamp.valueOf(dateTimeInput.replace("T", " ").concat(":00"));
		vo.setEndTime(endTime);

		int result = adminService.insertAuction(vo);
		if (result > 0) {
			rttr.addFlashAttribute("result", 1);
		} else {
			rttr.addFlashAttribute("result", 0);
		}

		return "redirect:/";
	}
	// 옥션 끝

	// 회원관리 시작
	// 회원관리 페이지
	@GetMapping("userManagementPage")
	public void userManagementpageGET(Model model) throws Exception {
		System.out.println("userManagementPage 접속");
		ArrayList<UserVO> user = adminService.getUserList();
		model.addAttribute("shopUser", user);
	}

	// 회원정보 수정
	@GetMapping("userManagementEdit")
	public void userManagementEditGET(String userid, Model model) throws Exception {
		System.out.println("userManagementEdit 접속");
		UserVO user = adminService.getUser(userid);
		model.addAttribute("shopUser", user);
	}

	// 회원 삭제
	@GetMapping("userDelete")
	public String userDeleteGET(String shopUserid) throws Exception {
		System.out.println("userDelete 접속");
		adminService.deleteUser(shopUserid);
		return "redirect:/admin/userManagementPage";
	}

	// 회원 수정 완료
	@PostMapping("userEditComplete.do")
	public String userEditCompletePOST(UserVO vo) throws Exception {
		System.out.println("userEditComplete.do 접속");
		adminService.adminUserUpdate(vo);
		System.out.println("userpoint: " + vo.getPoint());
		System.out.println("userupdate: " + userService.userUpdate(vo));
		return "redirect:/admin/userManagementEdit";
	}
	// 회원관리 끝

	// 상품 관리 시작
	// 상품관리 페이지
	@GetMapping("productManagementPage")
	public void productManageGET() {
		System.out.println("productManagementPage 접속");
	}

	// 브랜드 리스트
	@GetMapping("adminBrandList")
	public void adminBrandListGET(Model model) throws Exception {
		System.out.println("adminBrandList 접속");
		List<BrandVO> bList = productService.brandList();
		model.addAttribute("blist", bList);
	}

	// 브랜드 등록페이지
	@GetMapping("adminbrandWriteForm")
	public void adminBrandWriteFormGET() {
		System.out.println("adminbrandWriteForm 접속");
	}

	@PostMapping("brandWrite.do")
	public String brandWritePOST(String bname, MultipartFile uploadFile) throws Exception {
		System.out.println("brandWrite.do 접속");
		String uploadFolder = "C:\\Users\\User\\OneDrive\\바탕 화면\\Develop\\DiamondBlakc-SpringVer\\src\\main\\webapp\\resources\\img";

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder);

		System.out.println("uploadPath" + uploadPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 파일 이름 */
		String uploadFileName = uploadFile.getOriginalFilename();

		System.out.println("uploadfilename: " + uploadFileName);

		/* 파일 위치, 파일 이름을 합친 File 객체 */
		File saveFile = new File(uploadPath, uploadFileName);

		/* 파일 저장 */
		try {
			uploadFile.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		BrandVO brand = new BrandVO();
		brand.setBname(bname);
		brand.setImgurl(uploadFileName);
		adminService.brandEnroll(brand);
		return "redirect:/admin/adminBrandList";
	}

	@GetMapping("adminBrandDelete")
	public void adminBrandDelete(Model model) throws Exception {
		System.out.println("adminBrandDelete 접속");
		List<BrandVO> bList = productService.brandList();
		model.addAttribute("blist", bList);
	}

	@PostMapping("deleteBrand.do")
	public String deleteBrandPOST(String bname) throws Exception {
		System.out.println("deleteBrand.do 실행");
		System.out.println("삭제할 브랜드:" + bname);
		adminService.deleteBrand(bname);
		return "redirect:/admin/adminBrandList";
	}
	// 상품관리 끝

	// 매출 & 주문 관리
	@GetMapping("/sales_OrderManagement")
	public String salesOrderPost(HttpServletRequest request) throws Exception {

		ArrayList<OrderVO> newOrderlist = adminService.getNewOrder();// 새로운 주문 확인 result 1 --> 처리진행중 result 2로 변경
		request.setAttribute("newOrderlist", newOrderlist);

		ArrayList<OrderVO> processOrderlist = adminService.getProcessOrder();// 주문 처리 확인 result 2 --> 배송중 result 3으로 변경
		request.setAttribute("processOrderlist", processOrderlist);

		ArrayList<OrderVO> withdrawOrderlist = adminService.getWithdrawOrder();// 취소 주문 확인 result 4 --> 취소 완료 resulut 5로
																				// 변경
		request.setAttribute("withdrawOrderlist", withdrawOrderlist);

		ArrayList<OrderVO> salesOrderlist = adminService.getSalesOrder(); // 판매된 주문 확인
		request.setAttribute("salesOrderlist", salesOrderlist);

		return "/admin/salesManagementPage";

	}

	// 배송 처리 조회
	@GetMapping("/shipmentProcess")
	public String shipmentProcessGET(int ordernumber, HttpServletRequest request) throws Exception {

		ArrayList<ProductVO> plist = productService.getAllProduct(); // 모든 상품 가져오기
		request.setAttribute("plist", plist);

		ArrayList<OrderVO> olist = userService.getMyPurchasedDetail(ordernumber); // 주문번호로 정보 가져오기
		request.setAttribute("olist", olist);

		return "/admin/shipmentProcess";
	}

	// 주문 발송 요청
	@GetMapping("/shipmentOrder")
	@ResponseBody
	public ResponseEntity<String> shipmentOrderGET(@Param("userid") String userid,
			@Param("totalprice") Integer totalprice, int ordernumber, HttpServletRequest request) throws Exception {

		productService.increaseUserPoint(userid, totalprice); // 배송처리 후 포인트 지급

		adminService.shipmentChangeResult(ordernumber); // 배송처리
		return ResponseEntity.ok("Success");
	}

	// 신규 주문 조회
	@GetMapping("/orderProcess")
	public String orderProcessGET(int ordernumber, HttpServletRequest request) throws Exception {

		ArrayList<ProductVO> plist = productService.getAllProduct(); // 모든 상품 가져오기
		request.setAttribute("plist", plist);

		ArrayList<OrderVO> olist = userService.getMyPurchasedDetail(ordernumber); // 주문번호로 정보 가져오기
		request.setAttribute("olist", olist);

		return "/admin/orderCheckProcess";
	}

	// 주문 처리
	@GetMapping("/checkOrder")
	@ResponseBody
	public ResponseEntity<String> checkOrderGET(int ordernumber, HttpServletRequest request) {

		adminService.checkOrderChangeResult(ordernumber);

		return ResponseEntity.ok("Success");
	}

	// 취소 주문 확인
	@GetMapping("/withDrawOrderCheck")
	public String withDrawOrderCheckGET(int ordernumber, HttpServletRequest request) throws Exception {

		ArrayList<ProductVO> plist = productService.getAllProduct(); // 모든 상품 가져오기
		request.setAttribute("plist", plist);

		ArrayList<OrderVO> olist = userService.getMyPurchasedDetail(ordernumber); // 주문번호로 정보 가져오기
		request.setAttribute("olist", olist);

		return "/admin/withDrawOrderCheckProcess";
	}

	// 취소처리 확인
	@GetMapping("/withdrawOrder")
	@ResponseBody
	public ResponseEntity<String> withdrawOrderGET(int ordernumber, HttpServletRequest request) {

		adminService.withdrawOrderChangeResult(ordernumber);

		return ResponseEntity.ok("Success");
	}

	// 판매 완료 주문 확인
	@GetMapping("/salesOrder")
	public String salesOrderGET(int ordernumber, HttpServletRequest request) throws Exception {

		ArrayList<ProductVO> plist = productService.getAllProduct(); // 모든 상품 가져오기
		request.setAttribute("plist", plist);

		ArrayList<OrderVO> olist = userService.getMyPurchasedDetail(ordernumber); // 주문번호로 정보 가져오기
		request.setAttribute("olist", olist);

		return "/admin/salesOrder";
	}

}
