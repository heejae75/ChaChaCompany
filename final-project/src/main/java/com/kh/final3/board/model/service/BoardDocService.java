package com.kh.final3.board.model.service;

import java.util.ArrayList;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;

public interface BoardDocService {
	
	//게시글 작성 메소드 
	int insertDoc(Board b, ArrayList<BoardAttachment> atList);

}
