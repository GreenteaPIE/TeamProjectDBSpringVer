package com.db.model;

import java.util.Arrays;

public class Criteria {

	private int pageNum;

	private int amount;

	private String keyword;

	private String type;

	private String[] typeArr;

	private String category;

	private String[] categoryArr;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {

		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String[] getCategoryArr() {
		return categoryArr;
	}

	public void setCategoryArr(String[] categoryArr) {
		this.categoryArr = categoryArr;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + ", category=" + category + ", categoryArr="
				+ Arrays.toString(categoryArr) + "]";
	}

}
