package com.kh.final3.board.service;

import java.util.ArrayList;

import com.kh.final3.board.vo.BoardAttachment;
import com.kh.final3.common.vo.Board;

public interface BoardDocService {
	
	//게시글 작성 메소드 
	int insertDoc(Board b, ArrayList<BoardAttachment> atList);

}
