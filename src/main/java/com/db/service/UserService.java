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

	// 내 정보 수정 본인 확인
	public UserVO myPageCheck(UserVO user) throws Exception;

	// 내 정보 수정
	public int userUpdate(UserVO user) throws Exception;

	// 회원 탈퇴
	public int userExit(UserVO user) throws Exception;

}
