package com.kh.final3.main.model.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.attendance.model.vo.Attendance;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.email.model.vo.Email;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.schedule.model.vo.Schedule;


@Repository
public class MainDao {

	//최신 공지 조회 
	public ArrayList<Board> mainNoticeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.mainNoticeList");
	}

	//즐겨찾기한 공지 조회 
	public ArrayList<Board> mainNoticeLikedList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("mainMapper.mainNoticeLikedList", userId);
	}
	
	//최신 메일 조회 
	public ArrayList<Email> mainEmailList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("mainMapper.mainEmailList", userId);
	}

	//출근 등록 
	public int insertGoToWork(SqlSessionTemplate sqlSession, Attendance at) {
		return sqlSession.insert("mainMapper.insertGoToWork", at);
	}

	//퇴근 등록 
	public int updateLeaveToWork(SqlSessionTemplate sqlSession, Attendance at) {
		return sqlSession.update("mainMapper.updateLeaveToWork", at);
	}

	//임직원 조회 (팀) 
	public ArrayList<Member> mainOthersTeamList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("mainMapper.mainOthersTeamList",m);
	}

	//임직원 조회 (전체) 
	public ArrayList<Member> mainOthersAllList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("mainMapper.mainOthersAllList",m);
	}

	public ArrayList<Schedule> mainCalendarList(SqlSessionTemplate sqlSession, String deptCode) {
		return (ArrayList)sqlSession.selectList("mainMapper.mainCalendarList", deptCode);
	}

	public ArrayList<Schedule> mainDailyEvents(SqlSessionTemplate sqlSession, Map<String, Object> params) {
		return (ArrayList)sqlSession.selectList("mainMapper.mainDailyEvents", params);
	}


}
