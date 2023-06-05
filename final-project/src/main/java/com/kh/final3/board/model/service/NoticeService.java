package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.final3.common.vo.Board;
import com.kh.final3.common.vo.PageInfo;

public interface NoticeService {
	// 총 게시글 개수
	int selectListCount(String status);
	// 게시글 정보 조회
	ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map);
	// 조회수 증가
	int increaseCount(int boardNo);
	// 게시물 하나 조회
	Board selectNotice(int boardNo);
	// 게시물작성
	int insertNotice(BoardAttachment at, Board b);

}
