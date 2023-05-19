package com.db.model;

import lombok.Data;

@Data
public class CouponVO {
	private String userid, couponname, imgurl;
	private int discountprice, cnum, couponresult;
}