package com.kh.final3.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.final3.attendance.model.vo.AttendanceRecord;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.email.model.vo.Email;
import com.kh.final3.main.model.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;

	@RequestMapping("home.ma")
	public String MainHome() {
		return "main/userMain";
	}
	
	//공지 불러오기 
	@ResponseBody
	@RequestMapping(value="mainNoticeList.ma", produces="application/json; charset=UTF-8")
	public String mainNoticeList() {
		ArrayList<Board> mainNotice = mainService.mainNoticeList();
		return new Gson().toJson(mainNotice);
	}
	
	//메일 불러오기
	@ResponseBody
	@RequestMapping(value="mainEmailList.ma", produces="application/json; charseet=UTF-8")
	public String mainEmailList() {
		ArrayList<Email> mainEmail = mainService.mainEmailList();
		return new Gson().toJson(mainEmail);
	}
	
	//출근등록 
	@RequestMapping("insertGo.ar")
	public String insertGoToWork(AttendanceRecord ar, HttpSession session) {
		
		return null;
	}
}
