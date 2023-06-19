package com.kh.final3.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.attendance.model.vo.AttendanceRecord;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.email.model.vo.Email;
import com.kh.final3.main.model.dao.MainDao;
import com.kh.final3.member.model.vo.Member;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//최신 공지 조회 
	@Override
	public ArrayList<Board> mainNoticeList() {
		return mainDao.mainNoticeList(sqlSession);
	}

	//즐겨찾기 공지 조회 
	@Override
	public ArrayList<Board> mainNoticeLikedList(String userId) {
		return mainDao.mainNoticeLikedList(sqlSession, userId);
	}
	
	//최신 메일 조회 
	@Override
	public ArrayList<Email> mainEmailList(String userId) {
		return mainDao.mainEmailList(sqlSession, userId);
	}

	//출근 등록 
	@Override
	public int insertGoToWork(AttendanceRecord at) {
		return mainDao.insertGoToWork(sqlSession, at);
	}

	//퇴근 등록 
	@Override
	public int updateLeaveToWork(AttendanceRecord at) {
		return mainDao.updateLeaveToWork(sqlSession, at);
	}

	//팀 임직원 조회 
	@Override
	public ArrayList<Member> mainOthersTeamList(Member m) {
		return mainDao.mainOthersTeamList(sqlSession, m);
	}

	//임직원 조회 (전체) 
	@Override
	public ArrayList<Member> mainOthersAllList(Member m) {
		return mainDao.mainOthersAllList(sqlSession, m);
	}

}
