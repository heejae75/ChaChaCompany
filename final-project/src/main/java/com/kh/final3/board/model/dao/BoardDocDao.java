package com.kh.final3.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;

@Repository
public class BoardDocDao {

	public int insertDoc(SqlSessionTemplate sqlSession, Board b, ArrayList<BoardAttachment> atList) {

		return 0;
	}

}
