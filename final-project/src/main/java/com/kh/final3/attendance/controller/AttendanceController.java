package com.kh.final3.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.attendance.model.service.AttendanceService;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.attendance.model.vo.Record;
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
	// 휴가리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "leaveList.at", produces  = "application/json; charset=UTF-8")
	public String selectLeaveList(int userNo) {
		ArrayList<Leave> list = attendanceService.selectLeaveList(userNo);
		return new Gson().toJson(list);
	}
	// 근무 실적 계산 - 결과에 하루의 계획과 실적 담아가기(배열)
	@ResponseBody
	@RequestMapping(value = "selectAtt.at", produces = "application/json; charset=UTF-8")
	public String selectAtt(Attendance att) {
		// 신청한 근태유형조회(연차휴가/병가/오전반차/오후반차/휴무일/육아휴직/외근/출장)
		// 조회결과가 없다면 (정상근무)
		String currentDay = att.getCurrDate();
		Attendance att2 = attendanceService.selectLeave(att);
		System.out.println("근무타입 : " + att2);
		
		Record r = new Record();
		
		if(att2 == null || att2.getLeaveType().equals("외근") || att2.getLeaveType().equals("출장")) { // 미출근,정상근무,외근,출장 : 계획 8시간, 실적은 출퇴근시간
			r.setWorkPlan(8*60); // 계획(분단위)
			if(attendanceService.selectAtt(att) != null) {
				r.setWorkRecord(attendanceService.selectAtt(att).getWorkRecord()); // 실적조회(분 단위)
			}
			System.out.println(currentDay + " 근무실적1" + r);
		}else if(att2.getLeaveType().equals("오전반차") || att2.getLeaveType().equals("오후반차")) { // 반차근무
			r.setWorkPlan(4*60);
			if(attendanceService.selectAtt(att) != null) {
				r.setWorkRecord(attendanceService.selectAtt(att).getWorkRecord()); // 실적조회(분 단위)
			}
			System.out.println(currentDay + " 근무실적2" + r);
		}else { // 휴가, 병가, 휴무일, 육아휴직
			r = null; // 근무 계획 및 실적 없음
			System.out.println(currentDay + " 근무실적3" + r);
		}
		System.out.println("리턴");
		return new Gson().toJson(r);
	}

	
	

}
