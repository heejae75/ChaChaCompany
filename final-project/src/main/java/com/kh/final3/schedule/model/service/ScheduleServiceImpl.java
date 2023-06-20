package com.kh.final3.schedule.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.schedule.model.dao.ScheduleDao;
import com.kh.final3.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	ScheduleDao scheduleDao;
	
	@Autowired
	SqlSession sqlSession;
	
	//스케줄 등록 메소드
	@Override
	public int addSchedule(Schedule deptSc) {
		
		return scheduleDao.addSchedule(sqlSession, deptSc);
	}
	
	//스케줄 조회 메소드 
	@Override
	public ArrayList<Schedule> getSchedule(String deptCode) {

		return scheduleDao.getSchedule(sqlSession,deptCode);
	}

}
