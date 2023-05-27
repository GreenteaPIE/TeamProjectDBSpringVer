package com.db.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.mapper.PageMakerDTO;
import com.db.model.BoardVO;
import com.db.model.Criteria;
import com.db.model.FBoardReplyVO;
import com.db.service.BoardService;
import com.db.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService bservice;

	@Inject
	private ReplyService replyService;

//	@GetMapping("/list")
//	public void boardListGET(Model model) {
//		log.info("게시판 목록 페이지 진입");
//		
//		model.addAttribute("list", bservice.getList());

//	}

	@GetMapping("/enroll")
	public void boardEnrollGET() {
		log.info("게시판 등록 페이지 진입");

	}

	// 게시판 등록
	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr, Criteria cri) {
		log.info("BoardVO : " + board);

		bservice.enroll(board);

		rttr.addFlashAttribute("result", "enrol success");

		return "redirect:/board/list?pageNum=1&amount=10&keyword=&type=&category=" + cri.getCategory();

	}

	// 게시판 조회

	@GetMapping("/get")
	public void boardGetPageGET(@RequestParam("num") int num, Model model, Criteria cri) throws Exception {
		bservice.updateReadCount(num);
		log.info("게시글번호:" + num);
		model.addAttribute("pageInfo", bservice.getPage(num));
		model.addAttribute("cri", cri);
		model.addAttribute("reply_Count", bservice.getReplyCount(num));

		// 댓글 조회
		List<FBoardReplyVO> reply = null;
		reply = replyService.replyList(num);
		model.addAttribute("reply", reply);

	}

	// 수정 페이지 이동

	@GetMapping("/modify")
	public void boardModifyGET(int num, Model model, Criteria cri) {
		model.addAttribute("pageInfo", bservice.getPage(num));

		model.addAttribute("cri", cri);
	}

	// 페이지 수정

	@PostMapping("/modify")
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr, Criteria cri) {
		bservice.modify(board);

		rttr.addFlashAttribute("result", "modify success");

		return "redirect:/board/list?pageNum=1&amount=10&keyword=&type=&category=" + cri.getCategory();
	}

	// 페이지 삭제
	@PostMapping("/delete")
	public String boardDeletePOST(int num, RedirectAttributes rttr, Criteria cri) {
		bservice.delete(num);

		rttr.addFlashAttribute("result", "delete success");

		return "redirect:/board/list?pageNum=1&amount=10&keyword=&type=&category=" + cri.getCategory();
	}

	// 게시판 목록 페이지 접속(페이징)
	@GetMapping("/list")
	public void boardListGET(HttpServletRequest request, Model model, Criteria cri,
			@RequestParam(required = false) String category) {

		log.info("boardListGET");

		cri.setCategory(category); // category 값을 저장합니다.

		model.addAttribute("list", bservice.getListPaging(cri));

		int total = bservice.getTotal(cri);
		request.setAttribute("category", category);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);
	}

	// 이미지 업로드
	@RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try {
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = "C:\\upload\\Pictures\\Saved Pictures" + "ckImage/"; // 이미지 경로 설정(폴더 자동 생성)
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);
			System.out.println("path:" + path); // 이미지 저장경로 console에 확인
			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/board/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}

	// 서버로 전송된 이미지 뿌려주기
	@RequestMapping(value = "/board/ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = "C:\\upload\\Pictures\\Saved Pictures" + "ckImage/"; // 저장된 이미지 경로
		System.out.println("path:" + path);
		String sDirPath = path + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}

}
