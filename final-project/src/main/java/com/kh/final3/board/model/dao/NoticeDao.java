package com.kh.final3.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.board.model.vo.Reply;
import com.kh.final3.common.vo.PageInfo;

@Repository
public class NoticeDao {
	// 게시글 갯수
	public int selectListCount(SqlSessionTemplate sqlSession, String status) {
		return sqlSession.selectOne("noticeMapper.selectListCount", status);
	}
	// 게시글리스트
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", map, rowBounds);
	}
	// 조회수증가 
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.increaseCount", boardNo);
	}
	// 게시글 하나 조회
	public Board selectNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", boardNo);
	}
	// 첨부파일 조회
	public BoardAttachment selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectAttachment", boardNo);
	}
	// 게시글작성
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("noticeMapper.insertNotice", b);
	}
	// 첨부파일 등록
	public int insertAttachment(SqlSessionTemplate sqlSession, BoardAttachment at) {
		return sqlSession.insert("noticeMapper.insertAttachment", at);
	}
	// 댓글조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", boardNo);
	}
	// 댓글작성
	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.insert("noticeMapper.insertReply", reply);
	}
	// 게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.deleteBoard", boardNo);
	}
	// 즐겨찾기 조회
	public int selectBookmark(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("noticeMapper.selectBookmark", map);
	}
	// 즐겨찾기 해제
	public int deleteBookmark(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.delete("noticeMapper.deleteBookmark", map);
	}
	// 즐겨찾기 추가
	public int insertBookmark(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("noticeMapper.insertBookmark", map);
	}
	// 즐겨찾기 한 게시물 갯수 조회
	public int selectBookmarkCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("noticeMapper.selectBookmarkCount", userNo);
	}
	// 즐겨찾기 한 게시물 리스트 조회
	public ArrayList<Board> selectBookmarkList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectBookmarkList", userNo, rowBounds);
	}
	

}
