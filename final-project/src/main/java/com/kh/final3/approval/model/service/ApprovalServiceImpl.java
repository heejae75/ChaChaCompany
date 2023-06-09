package com.kh.final3.Approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.Approval.model.dao.ApprovalDao;
import com.kh.final3.Approval.model.vo.Approval;
import com.kh.final3.Approval.model.vo.ApprovalDoc;
import com.kh.final3.common.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private ApprovalDao ad;
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public int selectListCount(String status) {
		return ad.selectListCount(ss, status);
	}

	@Override
	public ArrayList<ApprovalDoc> selectApprovalList(PageInfo pi, String status) {
		return ad.selectApprovalList(ss,pi, status);
	}

	@Override
	public ArrayList<ApprovalDoc> approvalMainList(String status) {
		return ad.approvalMainList(ss,status);
	}
}
