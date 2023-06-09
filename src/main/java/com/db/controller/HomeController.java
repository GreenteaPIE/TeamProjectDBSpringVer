package com.db.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.db.model.BrandVO;
import com.db.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/*")
public class HomeController {

	@Autowired
	ProductService productService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@GetMapping("/")
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		try {
			ArrayList<BrandVO> bvo = productService.brandList();
			session.setAttribute("blist", bvo); // 브랜드 리스트를 세션에 불러옴

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "home";
	}
	// qna 페이지
    @GetMapping("/qna")
    public void qnaGET() {
       logger.info("qna 페이지 진입");
    }

	// Contact 페이지
	@GetMapping("/contact")
	public void contactGET() {
		logger.info("contact 페이지 진입");
	}

	// Event 페이지
	@GetMapping("/event")
	public void eventGET() {
		logger.info("event 페이지 진입");
	}

}
