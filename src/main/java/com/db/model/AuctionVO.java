package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AuctionVO {
	private String userid, bname, pname, psize, imgUrl;
	private int price, endPrice, startPrice, onOff, num;
	private Timestamp endTime;
}