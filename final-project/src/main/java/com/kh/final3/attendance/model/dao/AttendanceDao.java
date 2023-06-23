package com.kh.final3.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.attendance.model.vo.Attendance;

@Repository
public class AttendanceDao {

	public ArrayList<Attendance> attendanceList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.attendanceList");
	}

}
