package com.kh.final3.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.Item;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;


public interface ApprovalService {
	
	//각 status의 갯수 가져오기
		int selectListCount(String status);
		
		//결재함 리스트 불러오기
		ArrayList<ApprovalDoc> selectApprovalDocList(PageInfo pi, String status);
		//리스트 불러오기용 approval불러오기
		ArrayList<Approval> selectApprovalList();
		
		//결재 홈 리스트 불러오기
		ArrayList<ApprovalDoc> approvalMainList(String status);
		
		//양식리스트 가져오기
		ArrayList<DocType> selectEnrollList();
		
		//결재라인 사원조회
		ArrayList<Member> selectApproverList(String deptCode);
		
		//결재라인 사원 검색
		ArrayList<Member> searchApproverList(HashMap<String, String> map);
		
		//구매품의서 작성
		int insertItem(Item i, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//휴가계 작성
		int insertLeave(Leave l, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//결재자 조회
		Approval selectApproval(int docNo);
		
		//결재문서 첨부파일 조회
		ArrayList<ApprovalAttachment> selectApprovalAttachment(int docNo);
		
		//결재문서 조회
		ApprovalDoc selectApprovalDoc(int docNo);
		
		//구매품의서 내용 조회
		Item selectItem(int docNo);
		
		//휴가계 내용조회
		Leave selectLeave(int docNo);

		//중간결재자 반려
		int updateSecondReturnReason(Approval a);
		
		//최종결재자 반려
		int updateLastReturnReason(Approval a, ApprovalDoc ad);
		
		//중간결재자 승인
		int updateSecondApprover(Approval a);
		
		//최종결재자 승인
		int updateLastApprover(Approval a,ApprovalDoc ad);
		
		//결재 홈 그래프
		List<ApprovalDoc> monthData(ApprovalDoc ad);

	
	
}
