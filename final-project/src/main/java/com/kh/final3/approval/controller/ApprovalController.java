package com.kh.final3.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.approval.model.service.ApprovalService;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.item;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.template.SaveFile;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = {"/member", "/admin"}, method= {RequestMethod.GET,RequestMethod.POST})
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
	
	@RequestMapping("enrollList.ap")
	public String enrollList(Model m) {
		ArrayList<DocType> list = as.selectEnrollList();
		
		m.addAttribute("list",list);
		return "approval/enrollListView";
	}
	
	@RequestMapping("enrollForm.ap")
	public ModelAndView enrollForm(HttpServletRequest request, ModelAndView mv) {
		int appNo = Integer.parseInt(request.getParameter("appNo"));
		
		
		
		if(appNo==1) {
			mv.setViewName("approval/leaveForm");
		}else if(appNo==2) {
			
			mv.setViewName("approval/itemForm");
		}else if(appNo==3) {
			mv.setViewName("approval/minutes");
		}
		return mv;
	}
	
//	//��� �ҷ�����
	@ResponseBody
	@PostMapping(value="selectApproverList.ap",produces = "application/json; charset=UTF-8")
//	@RequestMapping(value="selectApproverList.ap", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=UTF-8")
	public String selectApproverList(@RequestParam String deptCode) {
		ArrayList<Member> list = as.selectApproverList(deptCode);
		log.debug("���?");
		return new Gson().toJson(list);
	}
	//�˻�
	@ResponseBody
	@PostMapping(value="searchApprover.ap",produces = "application/json; charset=UTF-8")
//	@RequestMapping(value="searchApprover.ap",method = {RequestMethod.GET,RequestMethod.POST},produces="application/json; charset=UTF-8")
	public String searchApprover(String status, String keyword){
		HashMap<String, String> map = new HashMap<>();
		
		map.put("status", status);
		map.put("keyword", keyword);
		
		ArrayList<Member> list = as.searchApproverList(map);
		
		return new Gson().toJson(list);
	}
	
	//����ǰ�Ǽ� �ۼ�
	@RequestMapping("item.ap")
	public ModelAndView insertItem(item i, ApprovalDoc ad, Approval a,ModelAndView mv,HttpSession session, ArrayList<MultipartFile> upfile){
		ArrayList<ApprovalAttachment> atList = new ArrayList<>();
		for(MultipartFile file : upfile) {
			if(!file.getOriginalFilename().equals("")) {
				String changeName = new SaveFile().getSaveFile(file, session);
				
				String filePath = session.getServletContext().getRealPath("/resources/uploadFiles/approvalDoc/");
				
				try {
					file.transferTo(new File(filePath+changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				ApprovalAttachment at = ApprovalAttachment.builder().originName(file.getOriginalFilename())
																	.changeName(changeName)
																	.filePath(filePath)
																	.deptCode(ad.getDeptCode()).build();
				
				atList.add(at);
			}
		}
		
		int result = as.insertItem(i,atList,ad,a);
		if(result>0) {
			session.setAttribute("alertMsg", "���繮���� ��ϵǾ����ϴ�.");
			mv.setViewName("redirect:list.ap");
		}else {
			for(ApprovalAttachment aa : atList) {
				new File(session.getServletContext().getRealPath(aa.getFilePath())).delete();
			}
			session.setAttribute("alertMsg", "���繮���� ����� �����Ͽ����ϴ�.");
			mv.setViewName("redirect:list.ap");
		}
		
		return mv;
	}
}
