package com.kh.final3.approval.model.service;

import java.util.ArrayList;

import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.common.vo.PageInfo;

public interface ApprovalService {
	
	//게시글 수 조회
	int selectListCount(String status);
	
	//결재함 전체조회
	ArrayList<ApprovalDoc> selectApprovalList(PageInfo pi, String status);
	
	//메인 최근 목록조회
	ArrayList<ApprovalDoc> approvalMainList(String status);
}
