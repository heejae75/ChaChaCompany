package com.kh.final3.Approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.Approval.model.vo.Approval;
import com.kh.final3.Approval.model.vo.ApprovalDoc;
import com.kh.final3.common.vo.PageInfo;

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

}
