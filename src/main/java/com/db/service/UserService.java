package com.db.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.db.model.BoardVO;
import com.db.model.CouponVO;
import com.db.model.Criteria;
import com.db.model.OrderVO;
import com.db.model.UserVO;

public interface UserService {

	// 회원가입
	public void userJoin(UserVO user) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String userid) throws Exception;

	// 로그인
	public UserVO userLogin(UserVO user) throws Exception;

	// 내 정보 수정 본인 확인
	public UserVO myPageCheck(UserVO user) throws Exception;

	// 내 정보 수정
	public int userUpdate(UserVO user) throws Exception;

	// 회원 탈퇴
	public int userExit(UserVO user) throws Exception;

	// 쿠폰 받기
	public int addCoupon(CouponVO coupon) throws Exception;

	// 쿠폰 보유 확인
	public CouponVO checkCoupon(CouponVO coupon);

	// 보유 쿠폰 확인
	public ArrayList<CouponVO> getMyCoupon(String userid);

	// 주문내역 리스트
	public ArrayList<OrderVO> getMyPurchased(String userid);

	// 주문내역 상세조회
	public ArrayList<OrderVO> getMyPurchasedDetail(int ordernumber);

	// 주문 취소 result -> 3 으로 변경
	public int withdrawChangeResult(@Param("ordernumber") int ordernumber);
	
	//글 목록(페이징)
	public List<BoardVO>getListPaging(Criteria cri);

}
