package com.kh.final3.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.common.vo.Board;
import com.kh.final3.common.vo.PageInfo;

@Repository
public class NoticeDao {

	public int selectListCount(SqlSessionTemplate sqlSession, String status) {
		return sqlSession.selectOne("noticeMapper.selectListCount", status);
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", map, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.increaseCount", boardNo);
	}

	public Board selectNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", boardNo);
	}

}
