package com.db.model;

import java.sql.Timestamp;

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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getpGender() {
		return pGender;
	}

	public void setpGender(int pGender) {
		this.pGender = pGender;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getPsize() {
		return psize;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPurchasedNum() {
		return purchasedNum;
	}

	public void setPurchasedNum(int purchasedNum) {
		this.purchasedNum = purchasedNum;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public Timestamp getWritedate() {
		return writedate;
	}

	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getDiscountrate() {
		return discountrate;
	}

	public void setDiscountrate(int discountrate) {
		this.discountrate = discountrate;
	}

	@Override
	public String toString() {
		return "ProductVO [num=" + num + ", pGender=" + pGender + ", bname=" + bname + ", kind=" + kind + ", pname="
				+ pname + ", imgUrl=" + imgUrl + ", psize=" + psize + ", balance=" + balance + ", price=" + price
				+ ", purchasedNum=" + purchasedNum + ", explain=" + explain + ", writedate=" + writedate
				+ ", readcount=" + readcount + ", discountrate=" + discountrate + "]";
	}

}
