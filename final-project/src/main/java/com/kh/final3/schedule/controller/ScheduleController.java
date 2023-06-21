package com.kh.final3.schedule.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.final3.schedule.model.service.ScheduleService;
import com.kh.final3.schedule.model.vo.Schedule;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class ScheduleController {

	@Autowired
	ScheduleService scheduleService;
	
	@RequestMapping("schedule.sc")
	public String scheduleHome() {
		
		return "schedule/schedule";
	}
	
	//일정 등록 메소드 
	@ResponseBody
	@RequestMapping(value="addSchedule.sc")
	public String addSchedule(Schedule deptSc, HttpSession session) {
		
		System.out.println(deptSc);
		
		int result = scheduleService.addSchedule(deptSc);
		
		System.out.println(result);
		
		if(result>0) {
			return "YYYY"; 

		}else {
			
			return "NNNN";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value ="getSchedule.sc", produces = "application/json; UTF-8")
	public String getSchedule(String deptCode) {
		
		ArrayList <Schedule> deptList = scheduleService.getSchedule(deptCode);
		
		return new Gson().toJson(deptList);
	}
	
}
