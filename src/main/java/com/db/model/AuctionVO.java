package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AuctionVO {
	private String userId, bName, pName, pSize, imgUrl;
	private int price, endPrice, startPrice, onOff, num;
	private Timestamp endTime;
}