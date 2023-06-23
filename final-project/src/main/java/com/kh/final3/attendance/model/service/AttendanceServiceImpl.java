package com.kh.final3.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.attendance.model.dao.AttendanceDao;
import com.kh.final3.attendance.model.vo.Attendance;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Attendance> attendanceList(int userNo) {
		return attendanceDao.attendanceList(sqlSession, userNo);
	}

	// 오늘의 근무계획 불러오기
	@Override
	public Attendance attendanceMain(int userNo) {
		return attendanceDao.attendanceMain(sqlSession, userNo);
	}

	@Override
	public int insertTodo(Attendance att) {
		return attendanceDao.insertTodo(sqlSession, att);
	}

	@Override
	public int updateTodo(Attendance att) {
		return attendanceDao.updateTodo(sqlSession, att);
	}

	@Override
	public Attendance selectTodo(int userNo) {
		return attendanceDao.selectTodo(sqlSession, userNo);
	}

}
