package com.kh.final3.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.attendance.model.vo.Attendance;

@Repository
public class AttendanceDao {
	// 출퇴근 시간 리스트 불러오기
	public ArrayList<Attendance> attendanceList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.attendanceList", userNo);
	}
	// 오늘의 근무 계획 불러오기
	public Attendance attendanceMain(SqlSessionTemplate sqlSession, int userNo) {
		return (Attendance) sqlSession.selectOne("attendanceMapper.attendanceMain", userNo);
	}
	public int insertTodo(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.insert("attendanceMapper.insertTodo", att);
	}
	public int updateTodo(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.update("attendanceMapper.updateTodo", att);
	}
	public Attendance selectTodo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("attendanceMapper.selectTodo", userNo);
	}
	public ArrayList<Leave> selectLeaveList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectLeaveList", userNo);
	}

}
