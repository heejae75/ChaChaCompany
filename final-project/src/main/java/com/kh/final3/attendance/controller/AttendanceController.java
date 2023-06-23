package com.kh.final3.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.final3.attendance.model.service.AttendanceService;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.member.model.vo.Member;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	// 오늘의 근무계획 및 출퇴근 데이터 불러오기
	@RequestMapping("userAtt.at")
	public String attendanceMain(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		// 출퇴근시간, 근무유형, 투두리스트
		Attendance att = attendanceService.attendanceMain(userNo);
		model.addAttribute("att",att);	
		 return "attendance/attendanceMain";
	}
	@ResponseBody
	@RequestMapping(value = "attList.at", produces = "application/json; charset=UTF-8")
	public String attendanceList(int userNo) {
		ArrayList<Attendance> list = attendanceService.attendanceList(userNo);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping("insert.at")
	public String insertTodo(Attendance att) {
		// 작성글이 있으면 수정, 아니면 삽입
		int result = 0;
		
		if(attendanceService.selectTodo(att.getUserNo())==null) {
			result = attendanceService.insertTodo(att);
		}else {
			result = attendanceService.updateTodo(att);
		}
		return (result > 0) ? "success" : "fail";
	}
	@ResponseBody
	@RequestMapping(value = "select.at", produces = "text/html; charset=UTF-8")
	public String selectTodo(int userNo) {
		Attendance att = attendanceService.selectTodo(userNo);
		return att.getTodoContent();
	}

	
	

}
