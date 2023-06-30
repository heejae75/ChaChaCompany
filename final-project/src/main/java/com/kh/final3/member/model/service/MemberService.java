package com.kh.final3.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

public interface MemberService {
	
	//관리자 가입
	int adminInsert(Member member);
	
	//아이디로 멤버 조회
	Member selectMemberById(String userId);

	//게시판 개수(회원의 총 개수 조회)
	int selectListCount(Map<String, String> map);
	
	//회원 조회해서 가져오는 메서드
	ArrayList<Member> selectList(PageInfo pi, Map<String, String> map);

	//사번으로 회원 조회하는 메서드
	Member selectMemberByUserNo(String userNo);

	//회원 업데이트 메서드
	int updateMember(Member member);

	//회원가입 메서드
	int insertMember(Member member);
}
