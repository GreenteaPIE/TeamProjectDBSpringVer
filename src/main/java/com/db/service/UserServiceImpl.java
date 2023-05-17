package com.db.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.UserMapper;
import com.db.model.CartVO;
import com.db.model.CouponVO;
import com.db.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper usermapper;

	@Override
	public void userJoin(UserVO user) throws Exception {

		usermapper.userJoin(user);

	}

	@Override
	public int idCheck(String userid) throws Exception {

		return usermapper.idCheck(userid);
	}

	@Override
	public UserVO userLogin(UserVO user) throws Exception {

		return usermapper.userLogin(user);
	}

	@Override
	public UserVO myPageCheck(UserVO user) throws Exception {

		return usermapper.myPageCheck(user);
	}

	@Override
	public int userUpdate(UserVO user) throws Exception {

		return usermapper.userUpdate(user);
	}

	@Override
	public int userExit(UserVO user) throws Exception {

		return usermapper.userExit(user);
	}

	@Override
	public int addCoupon(CouponVO coupon){
		
		CouponVO checkCoupon = usermapper.checkCoupon(coupon);//쿠폰 보유 확인
		
		if(checkCoupon != null) {
			return 2;
		}
		
		try {
		return usermapper.addCoupon(coupon);
		}catch (Exception e) {
			return 0;
		}
	}

	@Override
	public CouponVO checkCoupon(CouponVO coupon) {
		
		return usermapper.checkCoupon(coupon);
	}

	@Override
	public ArrayList<CouponVO> getMyCoupon(String userid) {
	
		return usermapper.getMyCoupon(userid);
	}

}
