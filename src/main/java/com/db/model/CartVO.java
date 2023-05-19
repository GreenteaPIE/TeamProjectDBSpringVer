package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
	private int cartnum;
	private String userid;
	private int num;
	private String psize;
	private int quantity;
	private int price;
	private Timestamp orderdate;
	private int result;
}
