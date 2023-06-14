package com.kh.final3.main.model.service;

import java.util.ArrayList;

import com.kh.final3.attendance.model.vo.AttendanceRecord;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.email.model.vo.Email;



public interface MainService {

	//최신 공지사항 조회 
	ArrayList<Board> mainNoticeList();
	
	//즐겨찾기한 공지사항 조회 
	ArrayList<Board> mainNoticeLikedList(String userId);

	//최신 메일 조회 
	ArrayList<Email> mainEmailList(String userId);

	int insertGoToWork(AttendanceRecord at);

	int updateLeaveToWork(AttendanceRecord at);

}
