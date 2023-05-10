package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO { // orders table + order_detail table

	private int orderNumber; // seq
	private int orderDetailNumber; // seq
	private int num; // product number
	private int quantity;
	private String userid;
	private String result;
	private Timestamp indate;
	private int totalprice;

}
