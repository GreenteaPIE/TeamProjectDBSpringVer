package com.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.db.model.FBoardReplyVO;
import com.db.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	private ReplyService service;

	// 댓글 작성
	@PostMapping("/write")
	public String postWirte(FBoardReplyVO vo) throws Exception {

		service.replyWriter(vo);

		return "redirect:/board/get?num=" + vo.getNum();
	}

	// 댓글 단일 조회(수정페이지)
	@GetMapping("/modify")
	public void getMofidy(@RequestParam("num") int num, @RequestParam("rno") int rno, Model model) throws Exception {

		FBoardReplyVO vo = new FBoardReplyVO();
		vo.setNum(num);
		vo.setRno(rno);

		FBoardReplyVO reply = service.replySelect(vo);

		model.addAttribute("reply", reply);
	}

	// 댓글 수정
	@PostMapping("/modify")
	public String postModify(FBoardReplyVO vo) throws Exception {

		service.replyModify(vo);

		return "redirect:/board/get?num=" + vo.getNum();
	}

	// 댓글 삭제
	@GetMapping("/delete")
	public String getDelete(FBoardReplyVO vo) throws Exception {

		service.replyDelete(vo);

		return "redirect:/board/get?num=" + vo.getNum();
	}

}
