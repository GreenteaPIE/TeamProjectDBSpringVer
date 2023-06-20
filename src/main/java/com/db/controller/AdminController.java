package com.db.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.mapper.PageMakerDTO;
import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.Criteria;
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

	// 옥션 결제
	@GetMapping("auctionBuyPage")
	public void auctionBuyPageGET(int num, Model model) throws Exception {
		AuctionVO auVo = productService.getAuctionDetail(num);
		model.addAttribute("auction", auVo);

	}
	// 옥션 끝

	// 회원관리 시작
	// 회원관리 페이지
	@GetMapping("userManagementPage")
	public void userManagementpageGET(Model model, Criteria cri, @RequestParam(required = false) String category)
			throws Exception {
		System.out.println("userManagementPage 접속");

		cri.setCategory(category); // category 값을 저장합니다.

		model.addAttribute("list", adminService.getUserListPaging(cri));

		int total = adminService.getUserTotal(cri);

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);
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
	@ResponseBody
	public String userEditCompletePOST(UserVO vo) throws Exception {
		System.out.println("userEditComplete.do 접속");
		System.out.println("uservo: " + vo);
		adminService.adminUserUpdate(vo);
		System.out.println("userupdate: " + userService.userUpdate(vo));
		String response = "success";
		return response;
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

	
	// 상품 리스트
		@GetMapping("adminProductList")
		public void adminProductListGET(Criteria cri, Model model) {
			logger.info("adminController, adminProductListGET 진입 .... ");
			/* 상품 목록 출력 */
			List productList = adminService.getProductList(cri);
			model.addAttribute("productList", productList);

			/* 페이지 이동 인터페이스 데이터 */
			int total = adminService.productGetTotal(cri);
			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMaker);
		}

		// 상품 등록
		@GetMapping("adminProductWriteForm")
		public void adiminProductWriteFormGET() {
			logger.info("adminController, adminProductWriteForm 진입 ... ");
		}

		@PostMapping(value = "uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<String> uploadAjaxActionPOST(@RequestParam("uploadFile") MultipartFile[] uploadFile,
				HttpSession session) {
			logger.info("uploadAjaxActionPOST 진입 ... ");

			String osName = System.getProperty("os.name").toLowerCase();
			String uploadFolder;
			
			if (osName.contains("win")) { // Windows
				System.out.println("현재 접속 중인 os : "+osName);
				uploadFolder = "C:\\Users\\User\\OneDrive\\바탕 화면\\Develop\\DiamondBlakc-SpringVer\\src\\main\\webapp\\resources\\img\\";
				System.out.println("지금 설정된 uploadFolder 경로 : "+uploadFolder);
			} else if (osName.contains("nix") || osName.contains("nux") || osName.contains("mac")) { // Linux, macOS
				System.out.println("현재 접속 중인 os : "+osName);
				uploadFolder = System.getProperty("user.home") + "/workspace/upload/tmp";
				System.out.println("지금 설정된 uploadFolder 경로 : "+uploadFolder);
			} else {
				throw new UnsupportedOperationException("지원되지 않는 운영체제입니다.");
			}

			/* 폴더 생성 */
			File uploadPath = new File(uploadFolder);

			if (!uploadPath.exists()) {
				uploadPath.mkdirs();
			}

			List<ProductVO> productVOList = new ArrayList<>();

			for (MultipartFile multipartFile : uploadFile) {

				/* 파일 이름 */
				String uploadFileName = multipartFile.getOriginalFilename();

				/* uuid 적용 파일 이름 */
//				String uuid = UUID.randomUUID().toString();

//				uploadFileName = uuid + "_" + uploadFileName;
				uploadFileName = uploadFileName;

				/* 파일 위치, 파일 이름을 합친 File 객체 */
				File saveFile = new File(uploadPath, uploadFileName);

				/* 파일 저장 */
				try {
					multipartFile.transferTo(saveFile);

					/* 이미지 객체 */
					ProductVO productVO = new ProductVO();
					productVO.setImgUrl(uploadFileName); // 파일 경로를 imgUrl로 저장
					productVOList.add(productVO);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			// imgUrl 값을 세션에 저장
			session.setAttribute("imgUrlList", productVOList);

			// You can build a JSON response object here with the desired data
			String jsonResponse = "{\"message\": \"File uploaded successfully.\"}";
			return ResponseEntity.status(HttpStatus.OK).body(jsonResponse);
		}

		@GetMapping("/display")
		public ResponseEntity<byte[]> getImage(@RequestParam("fileName") String fileName) {
			logger.info("getImage 진입 ... ");

			String osName = System.getProperty("os.name").toLowerCase();
			String filePath;
			if (osName.contains("win")) { // Windows
				System.out.println("현재 접속 중인 os : "+osName);
				filePath="C:\\Users\\User\\OneDrive\\바탕 화면\\Develop\\DiamondBlakc-SpringVer\\src\\main\\webapp\\resources\\img\\";
			} else if (osName.contains("nix") || osName.contains("nux") || osName.contains("mac")) { // Linux, macOS
				System.out.println("현재 접속 중인 os : "+osName);
				filePath = System.getProperty("user.home") + "/workspace/upload/tmp";
			} else {
				throw new UnsupportedOperationException("지원되지 않는 운영체제입니다.");
			}
			
			File file = new File(filePath + fileName);

			logger.info("fileName : " + fileName);
			logger.info("file : " + file);

			ResponseEntity<byte[]> result = null;

			try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return result;
		}

		@PostMapping("adminProductWriteForm")
		public String adminProductWriteFormPOST(ProductVO product, HttpSession session, RedirectAttributes rttr) {
			logger.info("adminController, adminProductWriteForm POST 진입 ... ");

			// 세션에서 imgUrl 값 가져오기
			List<ProductVO> imgUrlList = (List<ProductVO>) session.getAttribute("imgUrlList");

			// imgUrl 값이 null이 아니고 리스트에 값들이 있는 경우 설정
			if (imgUrlList != null && !imgUrlList.isEmpty()) {
				// 첫 번째 이미지 url을 가져옵니다.
				String imgUrl = imgUrlList.get(0).getImgUrl();
				product.setImgUrl(imgUrl);
			}

			// imgUrl 값 사용 후 세션에서 제거 (선택사항)
			session.removeAttribute("imgUrlList");

			adminService.productEnroll(product); // 데이터베이스에 저장
			rttr.addFlashAttribute("enroll_result", product.getPname());
			return "redirect:/admin/adminProductList";
		}

		// 상품등록 시 브랜드 검색창
		@GetMapping("brandPop")
		public void brandPopGET(Criteria cri, Model model) throws Exception {
			logger.info("adminController, brandPop 진입 ... ");

			/* 브랜드 목록 출력 */
			List brandList = adminService.getBrandList(cri);

			if (!brandList.isEmpty()) {
				model.addAttribute("brandList", brandList); // 브랜드 존재 경우
			} else {
				model.addAttribute("listCheck", "empty"); // 브랜드 존재하지 않을 경우
			}

			/* 페이지 이동 인터페이스 데이터 */
			int total = adminService.productGetTotal(cri);
			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMaker);

		}

		// 상품 정보
		@GetMapping("adminProductDetail")
		public void adiminProductDetailGET(int num, Criteria cri, Model model) {
			logger.info("adminController, adminProductDetail 진입 ... " + num);

			/* 목록 페이지 조건 정보 */
			model.addAttribute("cri", cri);

			/* 조회 페이지 정보 */
			model.addAttribute("productDetail", adminService.productGetDetail(num));
		}

		// 상품 수정
		@GetMapping("adminProductModify")
		public void adimProductModifyGET(int num, Model model) {
			logger.info("adminController, adminProductModify 진입 ... " + num);
			/* 조회 페이지 정보 */
			model.addAttribute("productDetail", adminService.productGetDetail(num));
		}

		/* 상품 정보 수정 */
		@Transactional
		@PostMapping("/adminProductModify")
		public String adminProductModifyPOST(ProductVO product, HttpSession session, RedirectAttributes rttr)
				throws Exception {
			logger.info("adminProductModifyPOST.........." + product);

			// 세션에서 imgUrl 값 가져오기
			List<ProductVO> imgUrlList = (List<ProductVO>) session.getAttribute("imgUrlList");

			// imgUrl 값이 존재하면 새로운 파일 업로드 후 가져온 이미지 경로를 저장하고, imgUrl 값이 없다면 기존 경로를 그대로 저장하기
			if (imgUrlList != null && !imgUrlList.isEmpty()) {
				String imgUrl = imgUrlList.get(0).getImgUrl();
				product.setImgUrl(imgUrl);
			} else {
				ProductVO oldProduct = adminService.productGetDetail(product.getNum());
				product.setImgUrl(oldProduct.getImgUrl());
			}

			// imgUrl 값 사용 후 세션에서 제거 (선택사항)
			session.removeAttribute("imgUrlList");

			int result = adminService.productModify(product);
			logger.info("result : " + result);
			rttr.addFlashAttribute("modify_result", result);

			return "redirect:/admin/adminProductList";
		}

		// 상품 삭제
		@PostMapping("/adminProductDelete")
		public String productDeletePOST(int num, RedirectAttributes rttr) {
			logger.info("productDeletePOST..........");
			int result = adminService.productDelete(num);
			rttr.addFlashAttribute("delete_result", result);
			return "redirect:/admin/adminProductList";

		}

		
	
	
	// 상품관리 끝
}
