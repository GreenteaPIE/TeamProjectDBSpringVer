package com.db.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.UserMapper;
import com.db.model.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
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

}
