package com.db.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.db.model.CouponVO;
import com.db.model.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {
	
	@Autowired
	private UserMapper usermapper;         //UserMapper.java 연동
	
	
	/*
	//회원가입 쿼리 테스트 메소드
	@Test
	public void userJoin() throws Exception{
		UserVO user = new UserVO();
		
		user.setUserid("test");
		user.setPass("test");
		user.setName("test");
		user.setEmail("test");
		user.setAddress1("test");
		user.setAddress2("test");
		user.setAddress3("test");
		user.setPhone("test");
		user.setGender(1);
		
		usermapper.userJoin(user);    //쿼리 메소드
		
	
	@Test
	public void userIdChk() throws Exception{
		String id = "admin"; //존재하는 아이디
		String id2 = "test123"; // 존재하지 않는 아이디
		usermapper.idCheck(id);
		usermapper.idCheck(id2);
		
	}
	
	@Test
	public void userLogin() throws Exception{
		
		UserVO user = new UserVO(); // UserVO변수 선언 및 초기화
		
		
		//올바른 아이디 비번 입력
		//user.setUserid("test");
		//user.setPass("test");
		
		//올바르지 않은 아이디 비번 입력
		user.setUserid("test1");
		user.setPass("test1");
				
				
		
		usermapper.userLogin(user);
		System.out.println("결과 값 : " + usermapper.userLogin(user));
	}
	

	
	
	}*
	@Test
	public void checkcoup() throws Exception{
		String userid="user";
		String couponname="test";
		CouponVO coupon = new CouponVO();
		coupon.setUserid(userid);
		coupon.setCouponname(couponname);
		
		CouponVO result = usermapper.checkCoupon(coupon);
		System.out.println("결과 : " + result);
	}
	 */
	
	@Test
	public void mycoup() throws Exception{
		String userid="user";

		usermapper.getMyCoupon(userid);
	}
	
	
	
}
