package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
	private int cartNum;
	private String userId;
	private int num;
	private String pSize;
	private int quantity;
	private int balance;
	private Timestamp orderdate;
}
