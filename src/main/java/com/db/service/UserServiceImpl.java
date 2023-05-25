package com.db.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.UserMapper;
import com.db.model.BoardVO;
import com.db.model.CouponVO;
import com.db.model.Criteria;
import com.db.model.OrderVO;
import com.db.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper usermapper;

	@Autowired
	ProductService productService;
	
	@Autowired
	BoardService bservice;
	
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

	@Override
	public ArrayList<OrderVO> getMyPurchased(String userid) {
		
		return usermapper.getMyPurchased(userid);
	}

	@Override
	public ArrayList<OrderVO> getMyPurchasedDetail(int ordernumber) {
		
		return usermapper.getMyPurchasedDetail(ordernumber);
	}

	@Override
	public int withdrawChangeResult(int ordernumber) {
		
		return usermapper.withdrawChangeResult(ordernumber);
	}

	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
	    // 1. 게시물 목록을 가져옵니다.
	    List<BoardVO> list = bservice.getListPaging(cri);

	    // 2. 각 게시물에 대해 댓글 개수를 가져와서 replyCount를 설정합니다.
	    for (BoardVO boardVO : list) {
	        int replyCount = bservice.getReplyCount(boardVO.getNum()); // 댓글 개수를 가져오는 새로운 메소드 호출
	        boardVO.setReply_count(replyCount); // 가져온 댓글 개수를 변수를 선언하지 않았기 때문에 발생한 오류입니다. `mapper.getListPaging(cri)` 결과를 담을 `list` 변수를 추가하면 해 BoardVO의 replyCount에 설정
	    }

	    return list;
	}



}
