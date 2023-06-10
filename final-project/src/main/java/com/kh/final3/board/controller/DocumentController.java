package com.kh.final3.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final3.board.service.BoardDocService;
import com.kh.final3.board.vo.BoardAttachment;
import com.kh.final3.common.template.SaveFile;
import com.kh.final3.common.vo.Board;

@Controller
public class DocumentController {
	
	
//	@Autowired
//	public SaveFile saveFile;
//	
//	@Autowired
//	public BoardAttachment at; 
//	
//	@Autowired 
//	public BoardDocService boardDocService;
	
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

	//게시글 작성 메소드 
	@RequestMapping("insertDoc.dc")
	public ModelAndView insertDoc(Board b,  ArrayList<MultipartFile> upfile , ModelAndView mv, HttpSession session) {
		
		ArrayList<BoardAttachment> atList = new ArrayList<>();
		
		for(MultipartFile file : upfile) {
			
			if(!file.getOriginalFilename().equals("")) {
				//BoardAttachment에 (bno, categoryCode, originName, changeName, filePath 담아주기)
				
				at.setRefBno(b.getBoardNo());
				
				at.setCategoryCode(b.getCategoryCode());
				
				at.setOriginName(file.getOriginalFilename());
				
				at.setChangeName(saveFile.getSaveFile(file, session));

				at.setFilePath(session.getServletContext().getRealPath("/resources/uploadFiles/boardDocument"));
			 
				
				//테스트 주석 
				
				atList.add(at);
			}
			
		}
		
		b.setBoardWriter("2"); //로그인 가능 후 지우고 로그인 유저 번호로 바꾸기 
		
		int result = boardDocService.insertDoc(b,atList);
		
		
		return null;
	}
}
