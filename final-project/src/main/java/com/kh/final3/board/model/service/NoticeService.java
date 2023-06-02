package com.kh.final3.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.final3.common.vo.Board;
import com.kh.final3.common.vo.PageInfo;

public interface NoticeService {

	int selectListCount(String status);

	ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map);

}
