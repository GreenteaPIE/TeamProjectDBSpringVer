package com.db.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.model.CartVO;
import com.db.model.CouponVO;
import com.db.model.UserVO;
import com.db.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 회원가입 페이지 이동
	@GetMapping("join")
	public void joinGET() {

		logger.info("회원가입 페이지 진입");

	}

	// 회원가입
	@PostMapping("join")
	public String joinPost(UserVO user) throws Exception {

		logger.info("join 진입");
		// 비밀번호 인코딩 후
		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = user.getPass(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		user.setPass(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장

		// 회원가입 쿼리 실행
		userService.userJoin(user);
		logger.info("회원 가입 성공");

		return "/user/welcome";

	}

	// 아이디 중복 검사
	@PostMapping("/userIdChk")
	@ResponseBody
	public String userIdChkPOST(String userid) throws Exception {

		logger.info("userIdChk() 진입");

		int result = userService.idCheck(userid);

		logger.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	} // userIdChkPOST()종료

	// 회원가입 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증 메일 : " + email);

		// 인증번호 생성 (6자리)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증 번호 : " + checkNum);

		// 이메일 보내기
		String setFrom = "dbad010101@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(setFrom);
			mailHelper.setTo(toMail);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);
			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}

	// 로그인 페이지 이동
	@GetMapping("login")
	public void loginGET() {
		logger.info("로그인 페이지 진입");
	}

	// 로그인
	@PostMapping("login")
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {

		System.out.println("login 메소드 진입");
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		UserVO vo = userService.userLogin(user);

		// 비밀번호 인코딩
		if (vo != null) { // 아이디&비밀번호 일치(로그인 성공)
			rawPw = user.getPass(); // 사용자가 제출한 비밀번호
			encodePw = vo.getPass(); // DB에 저장 되어있는 인코딩된 비밀번호
			if (true == pwEncoder.matches(rawPw, encodePw)) {
				vo.setPass("");
				session.setAttribute("user", vo);

				return "redirect:/";
			} else { // 비밀번호가 일치 하지 않을때(로그인 실패)
				rttr.addFlashAttribute("result", 0);
				return "redirect:/user/login";
			}
		} else { // 일치하는 아이디가 없을때(로그인 실패)
			rttr.addFlashAttribute("result", 0);
			return "redirect:/user/login"; // 로그인 페이지로 이동
		}
	}

	// 로그아웃
	@GetMapping("logout")
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		logger.info("logout 메소드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/";

	}

	// 내 정보 본인 확인 페이지로 이동
	@GetMapping("mypagechk")
	public String mypagechkGET(HttpServletRequest request, UserVO user) {

		logger.info("mypagecheck 페이지 진입");

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/user/myPageCheck";

	}

	// 내 정보 수정 본인 확인
	@PostMapping("mypagechk")
	public String mypagechkPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("mypagecheck 메소드 진입");
		String rawPw = "";
		String encodePw = "";
		UserVO vo = userService.myPageCheck(user);

		// 비밀번호 인코딩
		if (vo != null) { // 아이디&비밀번호 일치
			rawPw = user.getPass(); // 사용자가 제출한 비밀번호
			encodePw = vo.getPass(); // DB에 저장 되어있는 인코딩된 비밀번호
			if (true == pwEncoder.matches(rawPw, encodePw)) {
				vo.setPass("");
				session.setAttribute("user", vo);
				return "/user/myPageInfo";
			} else { // 비밀번호가 일치 하지 않을때
				request.setAttribute("result", 0);
				return "/user/myPageCheck";
			}
		} else { // 일치하는 아이디가 없을때
			request.setAttribute("result", 0);
			return "/user/myPageCheck";
		}
	}

	// 내 정보 수정
	@PostMapping("/userupdate")
	public String userUpdatePOST(UserVO user, RedirectAttributes rttr) throws Exception {

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = user.getPass(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		user.setPass(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장

		userService.userUpdate(user);

		return "redirect:/";

	}

	// 회원 탈퇴
	@PostMapping("/userexit")
	public String userExitPOST(UserVO user, RedirectAttributes rttr, HttpServletRequest request) throws Exception {

		userService.userExit(user);

		HttpSession session = request.getSession();

		session.invalidate(); // 탈퇴 메소드 실행 후 세션 종료

		return "redirect:/";
	}

	// 환영 쿠폰
	@PostMapping("/addWcoupon")
	@ResponseBody
	public String addWcouponPOST(@RequestParam String userid, @RequestParam String couponname,String imgurl,
			@RequestParam int discountprice, @ModelAttribute CouponVO coupon, HttpServletRequest request) throws Exception {
		     
		int result = userService.addCoupon(coupon);
		return result + "";

	}

	// 브론즈 쿠폰
	@PostMapping("/addBcoupon")
	@ResponseBody
	public String addBcouponPOST(@RequestParam String userid, @RequestParam String couponname,String imgurl,
			@RequestParam int discountprice, @ModelAttribute CouponVO coupon, HttpServletRequest request) throws Exception {
		     
		int result = userService.addCoupon(coupon);
		return result + "";

	}

	// 실버 쿠폰
	@PostMapping("/addScoupon")
	@ResponseBody
	public String addScouponPOST(@RequestParam String userid, @RequestParam String couponname,String imgurl,
			@RequestParam int discountprice, @ModelAttribute CouponVO coupon, HttpServletRequest request) throws Exception {
		     
		int result = userService.addCoupon(coupon);
		return result + "";

	}

	// 골드 쿠폰
	@PostMapping("/addGcoupon")
	@ResponseBody
	public String addGcouponPOST(@RequestParam String userid, @RequestParam String couponname,String imgurl,
			@RequestParam int discountprice, @ModelAttribute CouponVO coupon, HttpServletRequest request) throws Exception {
		     
		int result = userService.addCoupon(coupon);
		return result + "";

	}

	// 다이아 쿠폰
	@PostMapping("/addDcoupon")
	@ResponseBody
	public String addDcouponPOST(@RequestParam String userid, @RequestParam String couponname,String imgurl,
			@RequestParam int discountprice, @ModelAttribute CouponVO coupon, HttpServletRequest request) throws Exception {
		     
		int result = userService.addCoupon(coupon);
		return result + "";

	}
	
	// 보유 쿠폰 가져오기
	@GetMapping("/myCoupon")
	public String myCouponGET(String userid, HttpServletRequest request) {
		
		ArrayList<CouponVO> couplist = userService.getMyCoupon(userid);
		request.setAttribute("couplist", couplist);
		return "/user/myCoupon";
		
	}

}
