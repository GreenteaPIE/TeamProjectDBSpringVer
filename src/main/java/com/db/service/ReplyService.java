package com.db.service;

import java.util.List;

import com.db.model.FBoardReplyVO;

public interface ReplyService {
	
	// 댓글 조회
		public List<FBoardReplyVO> replyList(int num)throws Exception;

		// 댓글 조회
		public void replyWriter(FBoardReplyVO vo)throws Exception;

		// 댓글 수정
		public void replyModify(FBoardReplyVO vo)throws Exception;

		// 댓글 삭제
		public void replyDelete(FBoardReplyVO vo)throws Exception;
		
		// 단일 댓글 조회
		public FBoardReplyVO replySelect(FBoardReplyVO vo) throws Exception;


	}

