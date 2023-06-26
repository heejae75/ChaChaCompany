package com.kh.final3.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.service.MemberService;
import com.kh.final3.member.model.vo.CustomUserDetails;
import com.kh.final3.member.model.vo.Member;



@Controller
@RequestMapping(value = {"/member", "/admin", "/manager"})
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/managerPage.me")
	public String managerPage() {
		
		return "main/managerMain";
	}
	
	@GetMapping("/mainPage.me")
	public ModelAndView MemberLogin(ModelAndView mv, Principal p, HttpSession session) {
		if(session.getAttribute("loginUser") == null) {
			String userId = p.getName();
			Member member = memberService.selectMemberById(userId);
			session.setAttribute("loginUser", member);
		}
		
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
//		CustomUserDetails userDetails = (CustomUserDetails)principal;
//		String username = userDetails.getUsername();
//		String password = userDetails.getPassword();

		mv.setViewName("main/userMain");
		
		return mv;
	}
	
	@GetMapping("/list.me")
	public String memberList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
							 @RequestParam(value = "currentStatus", defaultValue = "USER_NO") String currentStatus,
							 String category, String searchWord, Model model) {
		
		
		Map<String, String> map = new HashMap<>();
		map.put("currentStatus", currentStatus);
		map.put("category", category);
		map.put("searchWord", searchWord);
		
		int listCount = memberService.selectListCount(map); //�쁽�옱 �옱吏곸쨷�씤 �쉶�썝�쓽 �닔
		int pageLimit = 10; //紐뉙럹�씠吏��뵫 - 1~10�럹�씠吏��뵫 蹂댁뿬以�
		int boardLimit = 20; //紐뉖챸�뵫 蹂댁뿬以꾩� - 20紐낆뵫 蹂댁뿬以�(Pagination�쓽 蹂��닔紐낃낵 留욎텛湲� �쐞�빐 boardLimit�쑝濡� �젙�쓽�븿)
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Member> list = memberService.selectList(pi, map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "member/memberListView";
	}
	
	@GetMapping("/detailList.me")
	public String memberDetailList(String userNo, Model model) {
		
		Member member = memberService.selectMemberByUserNo(userNo);

		model.addAttribute("member", member);
		
		return "member/memberDetailListView";
	}
	
	@PostMapping("/update.me") //미완성
	public ModelAndView updateMember(ModelAndView mv, Member member) {
		
		int result = memberService.updateMember(member);
		
		return null;
	}
	
	@GetMapping("/memberEnroll.me")
	public String memberEnroll() {
		
		return "member/memberEnrollForm";
	}
	
	@ResponseBody
	@GetMapping(value = "/idCheck.me", produces = "application/json; charset=UTF-8")
	public String idCheck(String userId) {
		
		Member member = memberService.selectMemberById(userId);
		
		if(member == null) {
			return new Gson().toJson("1");			
		}else {
			return new Gson().toJson("2");
		}
	}
	
	@PostMapping("/insert.me")
	public String insertMember(Member member, HttpSession session) {
		
		if(member.getJobCode().equals("J1") || member.getJobCode().equals("J2") || member.getJobCode().equals("J3")) {
			member.setAuth("ROLE_ADMIN");
		}else {
			member.setAuth("ROLE_MEMBER");
		}
		
		int result = memberService.insertMember(member);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입성공");
		}else {
			session.setAttribute("alertMsg", "회원가입실패");
		}
		
		
		return "main/adminMain";
	}
}
