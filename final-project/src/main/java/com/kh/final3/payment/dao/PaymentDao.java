package com.kh.final3.payment.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.payment.model.vo.Payment;

@Repository
public class PaymentDao {
	
	//전체 회원수 조회 
	public int selectMemberCount(SqlSession sqlSession) {

		return sqlSession.selectOne("paymentMapper.selectMemberCount");
	}
	
	//회원 목록 조회 
	public ArrayList<Member> selectMemberList(SqlSession sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("paymentMapper.selectMemberList", null, rowBounds);
	}
	
	//회원 기본 정보 조회 
	public Member selectMemberInfo(SqlSession sqlSession, int userNo) {

		return sqlSession.selectOne("paymentMapper.selectMemberInfo", userNo);
	}
	
	//급여 입력 -관리자 
	public int insertPayment(SqlSession sqlSession, Payment pay) {

		return sqlSession.insert("paymentMapper.insertPayment", pay);
	}

}
