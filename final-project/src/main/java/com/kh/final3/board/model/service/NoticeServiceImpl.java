package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.board.model.dao.NoticeDao;
import com.kh.final3.common.vo.Board;
import com.kh.final3.common.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 공지사항 총 게시글 개수 조회
	@Override
	public int selectListCount(String status) {
		return noticeDao.selectListCount(sqlSession, status);
	}
	
	// 게시글 리스트 조회
	@Override
	public ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map) {
		return noticeDao.selectList(sqlSession, pi, map);
	}
	// 조회수증가
	@Override
	public int increaseCount(int boardNo) {
		return noticeDao.increaseCount(sqlSession, boardNo);
	}
	// 게시물 하나 조회
	@Override
	public Board selectNotice(int boardNo) {
		return noticeDao.selectNotice(sqlSession, boardNo);
	}
	// 게시물작성
	@Override
	public int insertNotice(BoardAttachment at, Board b) {
		
		return 0;
	}

}
