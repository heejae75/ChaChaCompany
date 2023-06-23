package com.kh.final3.schedule.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	//일정 등록 메소드 
	public int addSchedule(SqlSession sqlSession, Schedule deptSc) {

		return sqlSession.insert("scheduleMapper.addSchedule", deptSc);
	}

	//일정 조회 메소드 
	public ArrayList<Schedule> getSchedule(SqlSession sqlSession, String deptCode) {

		return (ArrayList)sqlSession.selectList("scheduleMapper.getSchedule", deptCode);
	}
}
