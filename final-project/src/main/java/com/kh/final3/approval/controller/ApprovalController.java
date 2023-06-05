package com.kh.final3.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.final3.approval.model.service.ApprovalService;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.PageInfo;

@Controller 
public class ApprovalController {
	@Autowired
	private ApprovalService as;
	
	@RequestMapping("home.ap")
	public String approvalHome() {
		return "approval/approvalHome";
	}
	
	@RequestMapping("list.ap")
	public String approvalList(@RequestParam(value="currentPage",defaultValue="1")int currentPage,HttpServletRequest request, Model m) {
		String status = request.getParameter("status");
		int listCount = as.selectListCount(status);
		int pageLimit = 20;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<ApprovalDoc> list = as.selectApprovalList(pi,status);
		m.addAttribute("list",list);
		m.addAttribute("pi",pi);
		m.addAttribute("status", status);
		return "approval/approvalListView";
	}
	
	@ResponseBody
	@RequestMapping(value="approvalMainList.ap", produces="application/json; charset=UTF-8")
	public String approvalMainList(String status) {
		ArrayList<ApprovalDoc> list = as.approvalMainList(status);
		return new Gson().toJson(list);
	}
}
