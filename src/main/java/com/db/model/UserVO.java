package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVO {

	private String userid, pass, name, email, address1, address2, address3, phone;
	private int gender, point, grade;
	private Timestamp enter;

}