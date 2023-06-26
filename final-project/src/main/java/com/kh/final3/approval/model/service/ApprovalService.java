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
		
		//전체 결재문서 수
		int selectListCount(String status);
		
		//결재문서 조회
		ArrayList<ApprovalDoc> selectApprovalDocList(PageInfo pi, String status);
		
		//검색 결과 수
		int searchApprovalCount(HashMap<String, String> map);
		//검색 결과
		ArrayList<ApprovalDoc> searchApprovalDocList(HashMap<String, String> map, PageInfo pi);
		
		//홈 결재문서 리스트 조회
		ArrayList<ApprovalDoc> approvalMainList(String status);
		
		//결재문서 종류 조회
		ArrayList<DocType> selectEnrollList();
		
		//결재자 조회
		ArrayList<Member> selectApproverList(String deptCode);
		
		//결재자 검색 조회
		ArrayList<Member> searchApproverList(HashMap<String, String> map);
		
		//구매 품의서 
		int insertItem(ArrayList<Item> iList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//휴가계
		int insertLeave(ArrayList<Leave> leaveList, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//승인자 조회
		Approval selectApproval(int docNo);
		
		//첨부파일 조회
		ArrayList<ApprovalAttachment> selectApprovalAttachment(int docNo);
		
		//결재문서 상세 조회
		ApprovalDoc selectApprovalDoc(int docNo);
		
		//구매품의서 상세 조회
		ArrayList<Item> selectItem(int docNo);
		
		//휴가계 상세 조히
		ArrayList<Leave> selectLeave(int docNo);

		//以묎컙寃곗옱�옄 諛섎젮
		int updateSecondReturnReason(Approval a);
		
		//理쒖쥌寃곗옱�옄 諛섎젮
		int updateLastReturnReason(Approval a, ApprovalDoc ad);
		
		//以묎컙寃곗옱�옄 �듅�씤
		int updateSecondApprover(Approval a);
		
		//理쒖쥌寃곗옱�옄 �듅�씤
		int updateLastApprover(Approval a,ApprovalDoc ad);
		
		//寃곗옱 �솃 洹몃옒�봽
		List<ApprovalDoc> monthData(ApprovalDoc ad);

}
