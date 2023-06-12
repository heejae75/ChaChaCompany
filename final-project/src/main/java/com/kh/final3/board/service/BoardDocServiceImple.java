package com.kh.final3.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.final3.board.dao.BoardDocDao;
import com.kh.final3.board.vo.BoardAttachment;
import com.kh.final3.common.vo.Board;

@Service
public class BoardDocServiceImple implements BoardDocService{

	@Autowired
	public BoardDocDao boardDocDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	@Transactional
	public int insertDoc(Board b, ArrayList<BoardAttachment> atList) {
		
		return 0;
	}

}
