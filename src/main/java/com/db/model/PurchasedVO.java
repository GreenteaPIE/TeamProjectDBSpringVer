package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PurchasedVO {
	private String userid, bName, pName, imgUrl, pSize, orderNum, recipName, recipPhone, recipZipcode, recipAddr1,
			recipAddr2, memo, payMethod, status;
	private int price, purchasedPrice, quantity, pNum, discountRate, deliveryFee, pointUsed;
	private Timestamp orderDate;

}