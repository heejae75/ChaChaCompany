package com.kh.final3.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.final3.schedule.model.service.ScheduleService;
import com.kh.final3.schedule.model.vo.Schedule;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class ScheduleController {

	@Autowired
	ScheduleService scheduleService;
	
	@RequestMapping("schedule.sc")
	public String scheduleHome() {
		
		return "schedule/deptSchedule";
	}
	
	//일정 등록 메소드 
	@ResponseBody
	@RequestMapping(value="addSchedule.sc", produces = "application/json; UTF-8")
	public String addSchedule(Schedule deptSc) {
		
		//int result = scheduleService.addSchedule(deptSc);
		
		return "";
	}
	
}
