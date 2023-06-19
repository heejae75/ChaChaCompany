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
	
	//�� status�� ���� ��������
		int selectListCount(String status);
		
		//������ ����Ʈ �ҷ�����
		ArrayList<ApprovalDoc> selectApprovalDocList(PageInfo pi, String status);
		//����Ʈ �ҷ������ approval�ҷ�����
		ArrayList<Approval> selectApprovalList();
		
		//���� Ȩ ����Ʈ �ҷ�����
		ArrayList<ApprovalDoc> approvalMainList(String status);
		
		//��ĸ���Ʈ ��������
		ArrayList<DocType> selectEnrollList();
		
		//������� �����ȸ
		ArrayList<Member> selectApproverList(String deptCode);
		
		//������� ��� �˻�
		ArrayList<Member> searchApproverList(HashMap<String, String> map);
		
		//����ǰ�Ǽ� �ۼ�
		int insertItem(Item i, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//�ް��� �ۼ�
		int insertLeave(Leave l, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
		
		//������ ��ȸ
		Approval selectApproval(int docNo);
		
		//���繮�� ÷������ ��ȸ
		ArrayList<ApprovalAttachment> selectApprovalAttachment(int docNo);
		
		//���繮�� ��ȸ
		ApprovalDoc selectApprovalDoc(int docNo);
		
		//����ǰ�Ǽ� ���� ��ȸ
		Item selectItem(int docNo);
		
		//�ް��� ������ȸ
		Leave selectLeave(int docNo);

		//�߰������� �ݷ�
		int updateSecondReturnReason(Approval a);
		
		//���������� �ݷ�
		int updateLastReturnReason(Approval a, ApprovalDoc ad);
		
		//�߰������� ����
		int updateSecondApprover(Approval a);
		
		//���������� ����
		int updateLastApprover(Approval a,ApprovalDoc ad);
		
		//���� Ȩ �׷���
		List<ApprovalDoc> monthData(ApprovalDoc ad);

	
	
}
