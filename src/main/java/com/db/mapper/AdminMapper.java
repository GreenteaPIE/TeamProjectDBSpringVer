package com.db.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.OrderVO;
import com.db.model.UserVO;

public interface AdminMapper {

	public int insertAuction(AuctionVO aVo); // 옥션 등록

	public ArrayList<UserVO> getUserList(); // 유저 목록

	public void deleteUser(String userid); // 유저 삭제

	public UserVO getUser(String userid); // 유저 정보

	public void adminUserUpdate(UserVO uVo); // 유저 수정

	public void brandEnroll(BrandVO bVo); // 브랜드 추가

	public void deleteBrand(String bname); // 브랜드 삭제

	// 신규주문 가져오기
	public ArrayList<OrderVO> getNewOrder();

	// 처리주문 가져오기
	public ArrayList<OrderVO> getProcessOrder();

	// 취소주문 가져오기
	public ArrayList<OrderVO> getWithdrawOrder();

	// 판매된주문 가져오기
	public ArrayList<OrderVO> getSalesOrder();

	// 주문 확인처리 result -> 2 로 변경
	public int checkOrderChangeResult(@Param("ordernumber") int ordernumber);

	// 주문 발송처리 result -> 3 으로 변경
	public int shipmentChangeResult(@Param("ordernumber") int ordernumber);

	// 주문 취소처리 result -> 5 으로 변경
	public int withdrawOrderChangeResult(@Param("ordernumber") int ordernumber);

}
