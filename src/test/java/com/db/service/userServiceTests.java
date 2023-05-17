package com.db.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.db.model.CouponVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class userServiceTests {
	
	@Autowired UserService service;
	
	@Test
	public void addWelcomeCoupon() throws Exception{
		String userid="user";
		String couponname = "testcoup";
		int discountprice = 50000;
		
		CouponVO coupon = new CouponVO();
		coupon.setUserid(userid);
		coupon.setCouponname(couponname);
		coupon.setDiscountprice(discountprice);
		
	
		int result = service.addCoupon(coupon);
		System.out.println(result);
	}
}
