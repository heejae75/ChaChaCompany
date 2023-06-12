package com.kh.final3.member.model.service;

import com.kh.final3.member.model.vo.Member;

public interface MemberService {
	
	//관리자 가입
	int adminInsert(Member member);

	Member selectMemberById(String userId);
}
