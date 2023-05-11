package com.db.service;

import org.springframework.stereotype.Service;

import com.db.model.UserVO;

public interface UserService {

	// 회원가입
	public void userJoin(UserVO user) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String userid) throws Exception;

	// 로그인
	public UserVO userLogin(UserVO user) throws Exception;

}
