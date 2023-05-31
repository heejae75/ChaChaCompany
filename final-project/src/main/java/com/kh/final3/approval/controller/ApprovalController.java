package com.kh.final3.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class ApprovalController {
	
	@RequestMapping("home.ap")
	public String approvalHome() {
		return "approval/approvalHome";
	}
}
