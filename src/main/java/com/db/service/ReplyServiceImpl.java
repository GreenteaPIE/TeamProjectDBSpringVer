package com.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.ReplyMapper;
import com.db.model.FBoardReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;

	// 댓글 조회
	@Override
	public List<FBoardReplyVO> replyList(int bno) throws Exception {
		return mapper.replyList(bno);
	}

	@Override
	public void replyWriter(FBoardReplyVO vo) throws Exception {
		mapper.replyWriter(vo);
	}

	@Override
	public void replyModify(FBoardReplyVO vo) throws Exception {
		mapper.replyModify(vo);
	}

	@Override
	public void replyDelete(FBoardReplyVO vo) throws Exception {
		mapper.replyDelete(vo);
	}

	@Override
	public FBoardReplyVO replySelect(FBoardReplyVO vo) throws Exception {
		
		return mapper.replySelect(vo);
	}
}
