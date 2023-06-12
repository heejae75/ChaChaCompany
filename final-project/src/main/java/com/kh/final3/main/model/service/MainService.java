package com.kh.final3.main.model.service;

import java.util.ArrayList;

import com.kh.final3.board.model.vo.Board;
import com.kh.final3.email.model.vo.Email;



public interface MainService {

	ArrayList<Board> mainNoticeList();

	ArrayList<Email> mainEmailList();

}
