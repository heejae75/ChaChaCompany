package com.kh.final3.main.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.final3.alert.model.vo.Alert;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.messenger.model.vo.Messenger;
import com.kh.final3.schedule.model.vo.Schedule;
import com.kh.final3.todo.model.vo.Todo;



public interface MainService {

	//최신 공지사항 조회 
	ArrayList<Board> mainNoticeList();
	
	//즐겨찾기한 공지사항 조회 
	ArrayList<Board> mainNoticeLikedList(String userId);

	//최신 쪽지 조회 
	ArrayList<Messenger> mainMessengerList(String userId);

	//출근 등록 
	int insertGoToWork(Attendance at);

	//퇴근 등록 
	int updateLeaveToWork(Attendance at);

	//임직원 조회 (팀) 
	ArrayList<Member> mainOthersTeamList(Member m);

	//임직원 조회 (전체) 
	ArrayList<Member> mainOthersAllList(Member m);

	//전체 일정 조회 
	ArrayList<Schedule> mainCalendarList(String deptCode);

	//선택한 날짜 일정 조회 
	ArrayList<Schedule> mainDailyEvents(Map<String, Object> params);

	// 근무계획 조회
	Attendance selectLeaveType(int userNo);
	//전자결재 승인 상태 조회 
	ArrayList<Approval> mainApprovalStatus(Member m);

	//투두리스트 등록
	int mainInsertTodo(Todo td);

	//투두리스트 조회
	ArrayList<Todo> mainSelectTodoList(Member m);

	//투두리스트 수정
	int updateTodoList(Todo td);
	
	//투두리스트 한개 삭제 
	int deleteTodoList(int todoNo);

	//투두리스트 전체 삭제 
	int allDeleteTodoList(Member m);

	//알림 전체 조회
	ArrayList<Alert> menuAlertList(int userNo);

	//알림 a태그 선택시 상태 변경(읽음 처리)
	int menuAlertUpdate(Alert al);

	//알림 전체 삭제
	int menuAlertAllDelete(Member m);

	ArrayList<Attendance> selectOnTime(int userNo);

	//Attendance userMain(int userNo);

	int insertOnTime(Attendance at2);

	int insertOffTime(int userNo);

	ArrayList<Attendance> mainSelectOffTime(int userNo);

	int mainUpdateOnTime(int userNo);

	int selectCount(int userNo);
	

}
