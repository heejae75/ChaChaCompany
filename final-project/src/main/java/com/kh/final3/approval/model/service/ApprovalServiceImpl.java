package com.kh.final3.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.approval.model.dao.ApprovalDao;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.Item;
import com.kh.final3.approval.model.vo.Leave;
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
	public ArrayList<ApprovalDoc> selectApprovalDocList(PageInfo pi, String status) {
		return ad.selectApprovalDocList(ss,pi, status);
	}
	
	@Override
	public int searchApprovalCount(HashMap<String, String> map) {
		return ad.searchApprovalCount(ss, map);
	}

	@Override
	public ArrayList<ApprovalDoc> searchApprovalDocList(HashMap<String, String> map,PageInfo pi) {
		return ad.searchApprovalDocList(ss, map,pi);
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
	public int insertItem(ArrayList<Item> iList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a) {
		int ApprovalDocResult = ss.insert("approvalMapper.insertApprovalDoc",ad);
		int ApprovalResult = ss.insert("approvalMapper.insertApproval",a);
		int ApprovalAttachmentResult =1;
		int itemResult = 1;
		
		for(ApprovalAttachment aa : atList) {
			ApprovalAttachmentResult *= ss.insert("approvalMapper.insertApprovalAttachment",aa);
		}
		
		for(Item i : iList) {
			itemResult *= ss.insert("approvalMapper.insertItem",i);
		}
		
		int result = ApprovalDocResult*ApprovalResult*ApprovalAttachmentResult*itemResult;
		
		return result;
	}

	@Override
	@Transactional
	public int insertLeave(ArrayList<Leave> leaveList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a) {
		int ApprovalDocResult = ss.insert("approvalMapper.insertApprovalDoc",ad);
		int ApprovalResult = ss.insert("approvalMapper.insertApproval",a);
		int ApprovalAttachmentResult =1;
		int leaveResult = 1;
		
		for(ApprovalAttachment aa : atList) {
			ApprovalAttachmentResult *= ss.insert("approvalMapper.insertApprovalAttachment",aa);
		}
		
		for(Leave l : leaveList) {
			leaveResult *= ss.insert("approvalMapper.insertLeave",l);
		}
		
		int result = ApprovalDocResult*ApprovalResult*ApprovalAttachmentResult*leaveResult;
		
		return result;
	}

	@Override
	public Approval selectApproval(int docNo) {
		return ad.selectApproval(ss,docNo);
	}

	@Override
	public ArrayList<ApprovalAttachment> selectApprovalAttachment(int docNo) {
		return ad.selectApprovalAttachment(ss,docNo);
	}

	@Override
	public ApprovalDoc selectApprovalDoc(int docNo) {
		return ad.selectApprovalDoc(ss,docNo);
	}

	@Override
	public ArrayList<Item> selectItem(int docNo) {
		return ad.selectItem(ss,docNo);
	}
	
	@Override
	public ArrayList<Leave> selectLeave(int docNo) {
		return ad.selectLeave(ss,docNo);
	}
	

	@Override
	public int updateSecondReturnReason(Approval a) {
		int result = ad.updateSecondReturnReason(ss,a);
		return result;
	}
	
	@Override
	@Transactional
	public int updateLastReturnReason(Approval a, ApprovalDoc ad) {
		int result = ss.update("approvalMapper.updateLastReturnReason",a);
		int result2 = ss.update("approvalMapper.updateStatus",ad);
		return result*result2;
	}
	
	@Override
	public int updateSecondApprover(Approval a) {
		return ad.updateSecondApprover(ss,a);
	}

	@Override
	@Transactional
	public int updateLastApprover(Approval a, ApprovalDoc ad) {
		int result = ss.update("approvalMapper.updateLastApprover",a);
		int result2 = ss.update("approvalMapper.updateStatus", ad);
		
		return result * result2;
	}

	@Override
	public List<ApprovalDoc> monthData(ApprovalDoc ad1) {
		return ad.monthData(ss, ad1);
	}
}
