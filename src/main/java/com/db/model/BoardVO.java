package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {

	private String userid, title, content;
	private int readcount, num;
	private Timestamp writedate;
	private int reply_count;
	private String category;

}
