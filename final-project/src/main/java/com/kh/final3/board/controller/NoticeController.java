package com.kh.final3.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.final3.board.model.service.NoticeService;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.Board;
import com.kh.final3.common.vo.PageInfo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 게시판 메인으로 이동
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

}
