package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CateGoriesListVO {
	private int num;
	private int pGender;
	private String bName;
	private int kind;
	private String pName;
	private String imgUrl;
	private String pSize;
	private int balance;
	private int price;
	private int purchasedNum;
	private String explain;
	private Timestamp writedate;
	private int readcount;
	
}
