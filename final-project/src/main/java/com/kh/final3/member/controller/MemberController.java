package com.kh.final3.member.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final3.member.model.service.MemberService;
import com.kh.final3.member.model.vo.CustomUserDetails;
import com.kh.final3.member.model.vo.Member;



@Controller
@RequestMapping(value = {"/member", "/admin"})
public class MemberController {
	
	@GetMapping("/adminPage")
	public String adminPage() {
		
		return "test/adminPage";
	}
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/mainPage")
	public ModelAndView MemberLogin(ModelAndView mv, Principal p, HttpSession session) {
		if(session.getAttribute("loginUser") == null) {
			String userId = p.getName();		
			Member member = memberService.selectMemberById(userId);
			session.setAttribute("loginUser", member);
		}
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		CustomUserDetails userDetails = (CustomUserDetails)principal; 
		String username = userDetails.getUsername();
		String password = userDetails.getPassword();

		mv.setViewName("main/mainPage");
		
		return mv;
	}
	
	
}
