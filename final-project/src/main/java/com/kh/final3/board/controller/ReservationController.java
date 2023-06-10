package com.kh.final3.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.final3.board.model.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	public ReservationService reservationService;
	
	// 페이지 이동
	@RequestMapping("list.re")
	public String reservationList() {
		return "board/reservation/reservation";
	}

}
