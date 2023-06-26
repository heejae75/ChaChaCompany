package com.kh.final3.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.CustomUserDetails;
import com.kh.final3.member.model.vo.Member;

@Repository
public class MemberDao{

	public int adminInsert(SqlSession sqlSession, Member member) {
		
		return sqlSession.insert("memberMapper.insertAdmin", member);
	}

	public Member selectMemberById(SqlSession sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.selectMemberById", userId);
	}

	public CustomUserDetails selectMember(SqlSession sqlSession, String username) {

		return sqlSession.selectOne("memberMapper.selectMember", username);
	}

	public int selectListCount(SqlSession sqlSession, Map<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.selectListCount", map);
	}

	public ArrayList<Member> selectList(SqlSession sqlSession, PageInfo pi, Map<String, String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", map, rowBounds);
	}

	public Member selectMemberByUserNo(SqlSession sqlSession, String userNo) {
		
		return sqlSession.selectOne("memberMapper.selectMemberByUserNo", userNo);
	}

	public int updateMember(SqlSession sqlSession, Member member) {
		
		return sqlSession.update("memberMapper.updateMember", member);
	}

	public int insertMember(SqlSession sqlSession, Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}

}
