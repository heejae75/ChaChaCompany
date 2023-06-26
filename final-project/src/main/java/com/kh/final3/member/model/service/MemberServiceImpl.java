package com.kh.final3.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.dao.MemberDao;
import com.kh.final3.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override //관리자 가입. 비밀번호 처리 후 dao로 보냄
	public int adminInsert(Member member) {

		String encodedPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encodedPwd);
		int result = memberDao.adminInsert(sqlSession, member);
		
		return result;
	}

	@Override
	public Member selectMemberById(String userId) {
		
		return memberDao.selectMemberById(sqlSession, userId);
	}

	@Override
	public int selectListCount(Map<String, String> map) {
		
		return memberDao.selectListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi, Map<String, String> map) {
		
		return memberDao.selectList(sqlSession, pi, map);
	}

	@Override
	public Member selectMemberByUserNo(String userNo) {
		
		return memberDao.selectMemberByUserNo(sqlSession, userNo);
	}

	@Override
	public int updateMember(Member member) {
		
		return memberDao.updateMember(sqlSession, member);
	}

	@Override
	public int insertMember(Member member) {
		
		String encodedPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encodedPwd);
		
		return memberDao.insertMember(sqlSession, member);
	}

}
