package com.kh.final3.board.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.common.vo.PageInfo;

@Repository
public class FreeForumDao {
	
	//총 게시글 개수 조회
	public int selectListCount(SqlSession sqlSession, Map<String, String> map) {

		return sqlSession.selectOne("freeForumMapper.selectListCount", map);
	}
	
	//게시글 조회
	public ArrayList<Board> forumList(SqlSession sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("freeForumMapper.selectList", null, rowBounds);
	}

	public Board selectForumDetails(SqlSession sqlSession, int boardNo) {
		
		return sqlSession.selectOne("freeForumMapper.selectForumDetailsByNo", boardNo);
	}

	public ArrayList<BoardAttachment> selectAttachmentList(SqlSession sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("freeForumMapper.selectAttachmentList", boardNo);
	}

	public int increaseForumCount(SqlSession sqlSession, int boardNo) {
		
		return sqlSession.update("freeForumMapper.increaseForumCount", boardNo);
	}

	public int insertForum(SqlSession sqlSession, Board board) {
		
		return sqlSession.insert("freeForumMapper.insertForum", board);
	}

	public int checkRecommend(SqlSession sqlSession, Map<String, Integer> map) {
		
		return sqlSession.selectOne("freeForumMapper.checkRecommend", map);
	}

	public int insertRecommend(SqlSession sqlSession, Map<String, Integer> map) {
		
		return sqlSession.update("freeForumMapper.insertRecommend", map);
	}

	public int selectRecommendCount(SqlSession sqlSession, int boardNo) {
		
		return sqlSession.selectOne("freeForumMapper.selectRecommendCount", boardNo);
	}

	public int checkDeprecated(SqlSession sqlSession, Map<String, Integer> map) {
		
		return sqlSession.selectOne("freeForumMapper.checkDeprecated", map);
	}

	public int insertDeprecated(SqlSession sqlSession, Map<String, Integer> map) {
		
		return sqlSession.update("freeForumMapper.insertDeprecated", map);
	}

	public int selectDeprecatedCount(SqlSession sqlSession, int boardNo) {
		
		return sqlSession.selectOne("freeForumMapper.selectDeprecatedCount", boardNo);
	}


}
