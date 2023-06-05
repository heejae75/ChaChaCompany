package com.kh.final3.board.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.final3.board.vo.BoardAttachment;
import com.kh.final3.common.vo.Board;

@Repository
public class BoardDocDao {

	public int insertDoc(SqlSessionTemplate sqlSession, Board b, ArrayList<BoardAttachment> atList) {

		return 0;
	}

}
