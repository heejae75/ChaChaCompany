package com.kh.final3.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.item;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;


public interface ApprovalService {
	
	//게시글 수 조회
	int selectListCount(String status);
	
	//결재함 전체조회
	ArrayList<ApprovalDoc> selectApprovalList(PageInfo pi, String status);
	
	//메인 최근 목록조회
	ArrayList<ApprovalDoc> approvalMainList(String status);
	
	//양식리스트 가져오기
	ArrayList<DocType> selectEnrollList();
	
	//결재라인 사원조회
	ArrayList<Member> selectApproverList(String deptCode);
	
	//결재라인 사원 검색
	ArrayList<Member> searchApproverList(HashMap<String, String> map);
	
	//구매품의서 작성
	int insertItem(item i, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
}
