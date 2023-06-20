package com.kh.final3.main.model.service;

import java.util.ArrayList;

import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.email.model.vo.Email;
import com.kh.final3.member.model.vo.Member;



public interface MainService {

	//최신 공지사항 조회 
	ArrayList<Board> mainNoticeList();
	
	//즐겨찾기한 공지사항 조회 
	ArrayList<Board> mainNoticeLikedList(String userId);

	//최신 메일 조회 
	ArrayList<Email> mainEmailList(String userId);

	//출근 등록 
	int insertGoToWork(Attendance at);

	//퇴근 등록 
	int updateLeaveToWork(Attendance at);

	//임직원 조회 (팀) 
	ArrayList<Member> mainOthersTeamList(Member m);

	//임직원 조회 (전체) 
	ArrayList<Member> mainOthersAllList(Member m);

}
