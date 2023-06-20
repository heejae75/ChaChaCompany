package com.kh.final3.attendance.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.final3.attendance.model.service.AttendanceService;
import com.kh.final3.attendance.model.vo.Attendance;

@Controller
@RequestMapping(value = {"/member", "/admin"})
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping("userAtt.at")
	public String attendanceMain() {
		return "attendance/attendanceMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "attList.at", produces = "application/json; charset=UTF-8")
	public String attendanceList() {
		ArrayList<Attendance> list = attendanceService.attendanceList();
		return new Gson().toJson(list);
	}

	
	

}
