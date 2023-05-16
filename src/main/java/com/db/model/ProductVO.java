package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductVO {
	private int num;
	private int pGender;
	private String bname;
	private int kind;
	private String pname;
	private String imgUrl;
	private String psize;
	private int balance;
	private int price;
	private int purchasedNum;
	private String explain;
	private Timestamp writedate;
	private int readcount;
	private int discountrate;

}
