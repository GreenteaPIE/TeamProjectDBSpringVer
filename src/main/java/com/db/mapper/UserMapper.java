package com.db.mapper;

import java.util.ArrayList;
import java.util.List;

import com.db.model.BrandVO;
import com.db.model.CartVO;
import com.db.model.CouponVO;
import com.db.model.UserVO;

public interface UserMapper {

	// 회원가입
	public void userJoin(UserVO user);

	// 아이디 중복 검사
	public int idCheck(String userid);

	// 로그인
	public UserVO userLogin(UserVO user);

	// 내 정보 수정 본인 확인
	public UserVO myPageCheck(UserVO user);

	// 내 정보 수정
	public int userUpdate(UserVO user);

	// 회원 탈퇴
	public int userExit(UserVO user);

	// 쿠폰 받기
	public int addCoupon(CouponVO coupon);

	// 쿠폰 보유 확인
	public CouponVO checkCoupon(CouponVO coupon);
	
	// 보유 쿠폰 확인
	public ArrayList<CouponVO> getMyCoupon(String userid);

}
