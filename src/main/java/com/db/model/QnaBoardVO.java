package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaBoardVO {
	private String userid, title, content, imgurl;
	private int readcount, num;
	private Timestamp writedate;
}
