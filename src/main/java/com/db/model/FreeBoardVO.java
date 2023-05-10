package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FreeBoardVO {
	private String userid,title, content, imgurl;
	private int readcount, num;
	private Timestamp writedate;
}

