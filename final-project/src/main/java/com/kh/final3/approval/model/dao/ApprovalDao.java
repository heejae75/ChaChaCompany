package com.kh.final3.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

@RequestMapping(value={"/member","/admin"})
@Repository
public class ApprovalDao {

	public int selectListCount(SqlSessionTemplate ss, String status) {
		return ss.selectOne("approvalMapper.selectListCount",status);
	}

	public ArrayList<ApprovalDoc> selectApprovalList(SqlSessionTemplate ss, PageInfo pi,String status) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)ss.selectList("approvalMapper.selectApprovalList",status,rowBounds);
	}

	public ArrayList<ApprovalDoc> approvalMainList(SqlSessionTemplate ss, String status) {
		return (ArrayList)ss.selectList("approvalMapper.approvalMainList",status);
	}

	public ArrayList<DocType> selectEnrollList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("approvalMapper.selectEnrollList");
	}

	public ArrayList<Member> selectApproverList(SqlSessionTemplate ss, String deptCode) {
		return (ArrayList)ss.selectList("approvalMapper.selectApproverList",deptCode);
	}

	public ArrayList<Member> searchApproverList(SqlSessionTemplate ss, HashMap<String, String> map) {
		return (ArrayList)ss.selectList("approvalMapper.searchApproverList",map);
	}


}
