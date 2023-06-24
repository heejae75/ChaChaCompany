package com.kh.final3.attendance.model.service;

import java.util.ArrayList;

import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.attendance.model.vo.Attendance;

public interface AttendanceService {

	ArrayList<Attendance> attendanceList(int userNo);
	
	// 오늘의 근무계획 불러오기
	Attendance attendanceMain(int userNo);

	int insertTodo(Attendance att);

	int updateTodo(Attendance att);

	Attendance selectTodo(int userNo);
	
	//휴가리스트 불러오기
	ArrayList<Leave> selectLeaveList(int userNo);
	
	

}
