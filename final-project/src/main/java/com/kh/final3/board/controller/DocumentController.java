package com.kh.final3.board.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final3.board.model.service.BoardDocService;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.common.template.SaveFile;

@Controller
public class DocumentController {
	
	
	@Autowired
	public SaveFile saveFile;
	
	
	@Autowired 
	public BoardDocService boardDocService;
	
	//mapping주소 수정해야함 
	@RequestMapping("home.cm")
	public String boardHome() {
		return "board/board_document/board_DocumentList";
	}
	
	//자료 작성 페이지 이동 메소드
	@RequestMapping("enroll.dc")
	public String documentEnrollFrom() {
		
		return "board/board_document/board_DocumentEnrollForm";
	}

	
	
}
