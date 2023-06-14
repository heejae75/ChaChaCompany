package com.kh.final3.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.board.model.dao.BoardDocDao;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;

@Service
public class BoardDocServiceImple implements BoardDocService{

	@Autowired
	public BoardDocDao boardDocDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	//게시글 작성 메소드
	@Override
	@Transactional
	public int insertDoc(Board b, ArrayList<BoardAttachment> atList) {
		
		return 0;
	}

}
