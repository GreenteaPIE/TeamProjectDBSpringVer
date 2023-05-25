package com.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.BoardMapper;
import com.db.model.BoardVO;
import com.db.model.Criteria;





@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void enroll(BoardVO board) {
		
		mapper.enroll(board);
		
		
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public BoardVO getPage(int num) {
		
		return mapper.getPage(num);
	}

	@Override
	public int modify(BoardVO board) {
		
		return mapper.modify(board);
	}

	@Override
	public int delete(int num) {
		return mapper.delete(num);
	}

//	@Override
//	public List<BoardVO> getListPaging(Criteria cri) {
//		
//		
//		return mapper.getListPaging(cri);
//	}
	
	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
	    // 1. 게시물 목록을 가져옵니다.
	    List<BoardVO> list = mapper.getListPaging(cri);

	    // 2. 각 게시물에 대해 댓글 개수를 가져와서 replyCount를 설정합니다.
	    for (BoardVO boardVO : list) {
	        int replyCount = mapper.getReplyCount(boardVO.getNum()); // 댓글 개수를 가져오는 새로운 메소드 호출
	        boardVO.setReply_count(replyCount); // 가져온 댓글 개수를 변수를 선언하지 않았기 때문에 발생한 오류입니다. `mapper.getListPaging(cri)` 결과를 담을 `list` 변수를 추가하면 해 BoardVO의 replyCount에 설정
	    }

	    return list;
	}



	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotal(cri);
	}

	@Override
	public void updateReadCount(int num) {
		
		mapper.updateReadCount(num);
	}

	@Override
	public int getReplyCount(int num) {
		return mapper.getReplyCount(num);
	}
	
	
	
}
