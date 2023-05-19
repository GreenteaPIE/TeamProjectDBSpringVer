package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO { // orders table + order_detail table

	private int ordernumber; // seq
	private int orderdetailnumber; // seq
	private int num; // product number
	private int quantity;
	private int price;
	private String userid;
	private String psize;
	private String result;
	private Timestamp indate;
	private int totalprice;
	private String imgurl;
	private String pname;

}
