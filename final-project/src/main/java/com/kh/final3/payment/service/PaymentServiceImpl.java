package com.kh.final3.payment.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;
import com.kh.final3.payment.dao.PaymentDao;
import com.kh.final3.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체 회원수 조회
	@Override
	public int selectMemberCount() {

		return paymentDao.selectMemberCount(sqlSession);
	}
	
	//회원 목록 조회 
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		
		return paymentDao.selectMemberList(sqlSession, pi);
	}

	//회원 기본정보 조회 
	@Override
	public Member selectMemberInfo(int userNo) {

		return paymentDao.selectMemberInfo(sqlSession, userNo);
	}
	
	//급여 입력 
	@Override
	public int insertPayment(Payment pay) {

		return paymentDao.insertPayment(sqlSession, pay);
	}

}
