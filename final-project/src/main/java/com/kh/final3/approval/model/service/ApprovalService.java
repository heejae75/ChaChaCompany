package com.kh.final3.approval.model.service;

import java.util.ArrayList;

import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.common.vo.PageInfo;


public interface ApprovalService {
	
	//�Խñ� �� ��ȸ
	int selectListCount(String status);
	
	//������ ��ü��ȸ
	ArrayList<ApprovalDoc> selectApprovalList(PageInfo pi, String status);
	
	//���� �ֱ� �����ȸ
	ArrayList<ApprovalDoc> approvalMainList(String status);
}
