package com.kh.final3.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.main.model.service.MainService;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.messenger.model.vo.Messenger;
import com.kh.final3.schedule.model.vo.Schedule;
import com.kh.final3.todo.model.vo.Todo;

@RequestMapping(value={"/member","/admin"})
@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private Todo td;

	//최근 공지 불러오기 
	@ResponseBody
	@RequestMapping(value="mainNoticeList.ma", produces="application/json; charset=UTF-8")
	public String mainNoticeList() {
		ArrayList<Board> mainNotice = mainService.mainNoticeList();
		return new Gson().toJson(mainNotice);
	}
	
	//즐겨찾기  공지 불러오기 
	@ResponseBody
	@RequestMapping(value="mainNoticeLiked.ma", produces="application/json; charset=UTF-8")
	public String mainNoticeLikedList(HttpSession session) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		//System.out.println(userId);
		ArrayList<Board> mainNoticeLiked = mainService.mainNoticeLikedList(userId);
		//System.out.println(mainNoticeLiked);
		return new Gson().toJson(mainNoticeLiked);
	}
	
	
	//쪽지 불러오기
	@ResponseBody
	@RequestMapping(value="mainMessengerList.ma", produces="application/json; charseet=UTF-8")
	public String mainMessengerList(HttpSession session) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
//		System.out.println(userId);
		ArrayList<Messenger> mainMessenger = mainService.mainMessengerList(userId);
//		System.out.println(mainEmail);
		
		return new Gson().toJson(mainMessenger);
	}
	
	//출근등록 
	@PostMapping("insertGo.ma")
	//@RequestMapping("insertGo.ma")
	//@RequestMapping(value="insertGo.ma", method=RequestMethod.POST)
	public String insertGoToWork(Attendance at, HttpSession session, RedirectAttributes rttr) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		at.setUserNo(userNo);
		
		int result = mainService.insertGoToWork(at);
		
		if(result > 0) {
			rttr.addFlashAttribute("onTime",at.getOnTime());
			session.setAttribute("alertMsg", "출근 성공!");
		}else {
			session.setAttribute("alertMsg", "출근 실패! ");
		}
		return "redirect:/member/mainPage.me";
	}
	
	//퇴근 등록 
	//@RequestMapping("insertLeave.ma")
	@RequestMapping(value="insertLeave.ma", method=RequestMethod.POST)
	public String updateLeaveToWork(Attendance at, HttpSession session, RedirectAttributes rttr) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		at.setUserNo(userNo);
		
		int result = mainService.updateLeaveToWork(at);
		
		if(result > 0) {
			rttr.addFlashAttribute("onTime",at.getOnTime());
			session.setAttribute("alertMsg", "퇴근 성공!");
		}else {
			session.setAttribute("alertMsg", "퇴근 실패! ");
		}
		return "redirect:/member/mainPage.me";
	}
	
	//임직원조회(Team)
	@ResponseBody
	@RequestMapping(value="mainOthersTeamList.ma", produces="application/json; charset=UTF-8" )
	public String mainOthersTeamList(HttpSession session) {
		Member m = ((Member)session.getAttribute("loginUser"));

		ArrayList<Member> mainMemberTeam = mainService.mainOthersTeamList(m);
		
		return new Gson().toJson(mainMemberTeam);
	}
	
	//임직원조회(ALL)
	@ResponseBody
	@RequestMapping(value="mainOthersAllList.ma", produces="application/json; charset=UTF-8" )
	public String mainOthersAllList(HttpSession session) {
		Member m = ((Member)session.getAttribute("loginUser"));

		ArrayList<Member> mainMemberTeam = mainService.mainOthersAllList(m);
			
		return new Gson().toJson(mainMemberTeam);
	}
	
	//풀 캘린더에서 일정조회 
	@ResponseBody
	@RequestMapping(value="mainCalendar.ma", produces="application/json; charset=UTF-8")
	public String mainCalendarList(HttpSession session) {
		String deptCode = ((Member)session.getAttribute("loginUser")).getDeptCode();
		
		ArrayList<Schedule> list = mainService.mainCalendarList(deptCode);
		return new Gson().toJson(list);
	}
	
	//선택한 날짜 일정 조회 
	@ResponseBody
	@RequestMapping(value="mainDailyEvents.ma", method = RequestMethod.POST)
	public ArrayList<Schedule> mainDailyEvents(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("date") int date) {
		Map<String, Object> params = new HashMap<>();
		params.put("year", year);
		params.put("month", month);
		params.put("date", date);
		
		ArrayList<Schedule> events = mainService.mainDailyEvents(params);
		//System.out.println(events);
		return events;
	}
	
	//전자결재 리스트 조회 
	@ResponseBody
	@RequestMapping(value="mainApprovalStatus.ma", produces="application/json; charset=UTF-8")
	public String mainApprovalStatus(HttpSession session) {
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<Approval> aList = mainService.mainApprovalStatus(m);
		//System.out.println(aList);
		return new Gson().toJson(aList);
	}
	
	//투두리스트 입력
	@ResponseBody
	@RequestMapping(value="mainInsertTodo.ma", method = RequestMethod.POST)
	public String mainInsertTodo(HttpSession session, String todoContent) {
		Member m = ((Member)session.getAttribute("loginUser"));
		int userNo = m.getUserNo();
		
		//Todo td = new Todo();
		td.setUserNo(userNo);
		td.setTodoContent(todoContent);
		
		int result = mainService.mainInsertTodo(td);
		//System.out.println(result);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//투두 리스트 조회 
	@ResponseBody
	@RequestMapping(value = "selectTodoList.ma", produces = "application/json; charset=UTF-8")
	public String mainSelectTodoList(HttpSession session, int userNo) {
		Member m = ((Member)session.getAttribute("loginUser"));
		m.setUserNo(userNo);
		
		ArrayList<Todo> list = mainService.mainSelectTodoList(m);
		//System.out.println(list);
		return new Gson().toJson(list);
	}
	
	//투두 수정 
	@ResponseBody
	@RequestMapping(value = "updateTodoList.ma", method = RequestMethod.POST)
	public String updateTodoList(int todoNo, String status) {
		td.setTodoNo(todoNo);
		td.setStatus(status);
		
		int result = mainService.updateTodoList(td);
		System.out.println(result);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//투두 리스트 한개 삭제 
	@ResponseBody
	@RequestMapping(value = "deleteTodoList.ma", method = RequestMethod.POST)
	public String deleteTodoList(int todoNo) {
		int result = mainService.deleteTodoList(todoNo);
		
		return (result > 0) ? "success" : "fail";
	}
	
	//투두 리스트 모두 삭제 
	@ResponseBody
	@RequestMapping(value = "allDeleteTodoList.ma", method = RequestMethod.POST)
	public String allDeleteTodoList(HttpSession session, int userNo) {
		Member m = ((Member)session.getAttribute("loginUser"));
		m.setUserNo(userNo);
		
		int result = mainService.allDeleteTodoList(m);
		
		return (result > 0) ? "success" : "fail";
	}
	
}
