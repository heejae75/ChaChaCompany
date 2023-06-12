package com.kh.final3.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.member.model.vo.CustomUserDetails;
import com.kh.final3.member.model.vo.Member;

@Repository
public class MemberDao{

	public int adminInsert(SqlSession sqlSession, Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	public Member selectMemberById(SqlSession sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectMemberById", userId);
	}

	public CustomUserDetails selectMember(SqlSession sqlSession, String username) {

		return sqlSession.selectOne("memberMapper.selectMember", username);
	}

}
