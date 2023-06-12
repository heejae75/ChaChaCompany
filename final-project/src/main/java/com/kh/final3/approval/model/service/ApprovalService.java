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
	
	//ï¿½Ô½Ã±ï¿½ ï¿½ï¿½ ï¿½ï¿½È¸
	int selectListCount(String status);
	
	//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Ã¼ï¿½ï¿½È¸
	ArrayList<ApprovalDoc> selectApprovalList(PageInfo pi, String status);
	
	//ï¿½ï¿½ï¿½ï¿½ ï¿½Ö±ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½È¸
	ArrayList<ApprovalDoc> approvalMainList(String status);
	
	//¾ç½Ä¸®½ºÆ® °¡Á®¿À±â
	ArrayList<DocType> selectEnrollList();
	
	//°áÀç¶óÀÎ »ç¿øÁ¶È¸
	ArrayList<Member> selectApproverList(String deptCode);
	
	//°áÀç¶óÀÎ »ç¿ø °Ë»ö
	ArrayList<Member> searchApproverList(HashMap<String, String> map);
	
	//±¸¸ÅÇ°ÀÇ¼­ ÀÛ¼º
	int insertItem(item i, ArrayList<ApprovalAttachment> atList, ApprovalDoc ad, Approval a);
}
