package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ShopUserVO {

	private String userid, pass, name, email, address1, address2, phone, zipcode;
	private int gender, point, grade;
	private Timestamp enter;

}