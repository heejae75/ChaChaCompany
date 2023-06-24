package com.kh.final3.payment.service;

import java.util.ArrayList;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.payment.model.vo.Payment;

public interface PaymentService {
	
	//회원 전체수 조회 
	int selectMemberCount();
	
	//회원 목록 조회 
	ArrayList<Member> selectMemberList(PageInfo pi);
	
	//회원 기본정보 조회 
	Member selectMemberInfo(int userNo);
	
	//급여 입력 - 관리자
	int insertPayment(Payment pay);

}
