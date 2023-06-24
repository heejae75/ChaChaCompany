package com.kh.final3.payment.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.payment.model.vo.Payment;
import com.kh.final3.payment.service.PaymentService;

@RequestMapping(value= {"/member","/admin"})
@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	//일반회원 - 급여 조회 페이지 이동
	@RequestMapping("payment.me")
	public String paymentHome(int userNo) {
		
		return "payment/paymentView";
	}
	
	//관리자 - 급여 관리 페이지 이동 
	@RequestMapping("payment.ad")
	public ModelAndView paymentAdminHome(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		//전체 회원수 조회 
		int listCount = paymentService.selectMemberCount();
		int boardLimit = 10;
		int pageLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		//회원 조회 
		ArrayList<Member> mList = paymentService.selectMemberList(pi);
		
		mv.addObject("mList", mList).addObject("pi", pi).setViewName("payment/paymentList");
		
		return mv;
		
	}
	
	//관리자 - 급여 작성 페이지 이동 
	@RequestMapping("enrollPayment.ad")
	public ModelAndView enrollPayment(int userNo, ModelAndView mv) {
		
		//회원 기본정보 조회 -> 급여 작성페이지 이동(사번,이름,부서,직급,입사일, 은행, 계좌번호)
		Member mInfo = paymentService.selectMemberInfo(userNo);
		
		mv.addObject("mInfo", mInfo).setViewName("payment/enrollPaymentForm");
		
		return mv;
	}
	
	//관리자 - 급여 입력 메소드 
	@ResponseBody
	@RequestMapping("insertPayment.ad")
	public String insertPayment(Payment pay) {
		
		System.out.println(pay);
		
		int result = paymentService.insertPayment(pay);
		
		return (result>0)? "YYYY":"NNNN";
	}
}
