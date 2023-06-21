package com.kh.final3.schedule.model.service;

import java.util.ArrayList;

import com.kh.final3.schedule.model.vo.Schedule;

public interface ScheduleService {

	//부서 스케줄 등록 메소드 
	int addSchedule(Schedule deptSc);

	//부서 스케줄 조회 메소드 
	ArrayList<Schedule> getSchedule(String deptCode);
	
}
