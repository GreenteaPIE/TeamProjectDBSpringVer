package com.db.mapper;

import com.db.model.UserVO;

public interface UserMapper {
	
	//회원가입
	public void userJoin(UserVO user);
	
	//아이디 중복 검사
	public int idCheck(String userid);
	
	//로그인
	public UserVO userLogin(UserVO user);

}
