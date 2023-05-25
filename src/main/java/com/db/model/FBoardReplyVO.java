package com.db.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FBoardReplyVO {

	/*
	 * CREATE TABLE fboard_reply ( rno NUMBER(10) NOT NULL PRIMARY KEY, num
	 * NUMBER(10) NOT NULL, writer VARCHAR2(30) NOT NULL, content CLOB NOT NULL,
	 * regDate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, CONSTRAINT
	 * fk_fboard_reply_num FOREIGN KEY (num) REFERENCES free_board(num) );
	 */

	private int rno;
	private int num;
	private String writer;
	private String content;
	private Timestamp regDate;

}
