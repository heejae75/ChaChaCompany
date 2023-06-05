package com.kh.final3.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final3.board.model.service.NoticeService;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.Board;
import com.kh.final3.common.vo.PageInfo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 게시판 메인으로 이동, 검색기능
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String status, String keyword, Model model) {
		
		// 게시글 목록 조회
		
		int listCount = noticeService.selectListCount(status);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("status", status);
		
		ArrayList<Board> list = noticeService.selectList(pi, map);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("status", status);
		
		
		return "board/notice/noticeListView";
	}
	
	// 디테일뷰
	@RequestMapping("detail.no")
	public ModelAndView selectBoard(int boardNo, ModelAndView mv) {
	
		// 조회수증가
		int result = noticeService.increaseCount(boardNo);
		
		if(result > 0) {
			Board b = noticeService.selectNotice(boardNo);
			mv.addObject("b", b).setViewName("board/notice/noticeDetailView");
		}else {
//			mv.addObject("errorMsg","조회실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 글작성페이지 이동
	@RequestMapping("enroll.no")
	public String enrollForm() {
		return "board/notice/noticeEnrollForm";
	}
	
	// 글작성 insert
	@RequestMapping("insert.no")
	public ModelAndView insertBoard(ModelAndView mv, Board b, BoardAttachment at, MultipartFile upfile, HttpSession session) {
		
		// 첨부파일을 지정하든 안하든 이미 객체는 만들어져서 넘어온다.(filename의 원본명을 찾아서 있는지 없는지로 판별필요. null이 아니고)
		
		// 전달된 파일 있을 경우 - 파일명 수정작업 후 서버로 업로드 -> 원본명, 서버에 업로드 된 파일명 경로를 b에 추가하여 전달
		//System.out.println(upfile.getOriginalFilename()); // 첨부 안하면 빈 문자열
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName("resources/uploadFiles/" + changeName);
			
			int result = noticeService.insertNotice(at, b);
			
			if(result > 0) {
				mv.addObject("alertMsg","게시글 작성 성공").setViewName("redirect:list.no");
			}else {
				//mv.addObject("errorMsg","게시글 작성 실패").setViewName("common/errorPage");
			}
		}
		return mv;
	}
	
	// 파일 업로드 처리 메소드(모듈)
	public String saveFile(MultipartFile upfile, HttpSession session) {

		// 1. 원본 파일명 뽑기
		String originName = upfile.getOriginalFilename();

		// 2. 시간형식 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 3. 뒤에 붙을 다섯자리 랜덤값 뽑아주기
		int ranNum = (int) (Math.random() * 90000 + 10000); // 다섯자리 랜덤값

		// 4. 확장자명 추출하기
		String ext = originName.substring(originName.lastIndexOf("."));

		// 5. 추출한 문자열들 다 합해서 changeName만들기
		String changeName = currentTime + ranNum + ext;

		// 6. 업로드 하고자하는 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		// 7. 경로와 수정파일명을 합쳐 파일 업로드 하기
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;
	}

}
