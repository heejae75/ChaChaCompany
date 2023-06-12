package com.kh.final3.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.approval.model.dao.ApprovalDao;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.item;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

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

	@Override
	public ArrayList<DocType> selectEnrollList() {
		return ad.selectEnrollList(ss);
	}

	@Override
	public ArrayList<Member> selectApproverList(String deptCode) {
		return ad.selectApproverList(ss,deptCode);
	}

	@Override
	public ArrayList<Member> searchApproverList(HashMap<String, String> map) {
		return ad.searchApproverList(ss,map);
	}

	@Override
	@Transactional
	public int insertItem(item i, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a) {
		int ApprovalDocResult = ss.insert("approvalMapper.insertApprovalDoc",ad);
		int ApprovalResult = ss.insert("approvalMapper.insertApproval",a);
		int ApprovalAttachmentResult =1;
		
		for(ApprovalAttachment aa : atList) {
			ApprovalAttachmentResult *= ss.insert("approvalMapper.insertApprovalAttachment",aa);
		}
		
		int itemResult = ss.insert("approvalMapper.insertItem",i);
		
		int result = ApprovalDocResult*ApprovalResult*ApprovalAttachmentResult*itemResult;
		
		return result;
	}

}
