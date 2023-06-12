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
	
	
	//mapping二쇱냼 �닔�젙�빐�빞�븿
	@RequestMapping("home.cm")
	public String boardHome() {
		return "board/board_document/board_DocumentList";
	}
	
	//�옄猷� �옉�꽦 �럹�씠吏� �씠�룞 硫붿냼�뱶
	@RequestMapping("enroll.dc")
	public String documentEnrollFrom() {
		
		return "board/board_document/board_DocumentEnrollForm";
	}

	//寃뚯떆湲� �옉�꽦 硫붿냼�뱶 
	@RequestMapping("insertDoc.dc")
	public ModelAndView insertDoc(Board b,  ArrayList<MultipartFile> upfile , ModelAndView mv, HttpSession session) {
		
		ArrayList<BoardAttachment> atList = new ArrayList<>();
		
		for(MultipartFile file : upfile) {
			
			if(!file.getOriginalFilename().equals("")) {
				//BoardAttachment�뿉 (bno, categoryCode, originName, changeName, filePath �떞�븘二쇨린)
				
				at.setRefBno(b.getBoardNo());
				
				at.setCategoryCode(b.getCategoryCode());
				
				at.setOriginName(file.getOriginalFilename());
				
				at.setChangeName(saveFile.getSaveFile(file, session));

				at.setFilePath(session.getServletContext().getRealPath("/resources/uploadFiles/boardDocument"));
			 
				
				//�뀒�뒪�듃 二쇱꽍 
				
				atList.add(at);
			}
			
		}
		
		b.setBoardWriter("2"); //濡쒓렇�씤 媛��뒫 �썑 吏��슦怨� 濡쒓렇�씤 �쑀�� 踰덊샇濡� 諛붽씀湲� 
		
		int result = boardDocService.insertDoc(b,atList);
		
		
		return null;
	}
}
