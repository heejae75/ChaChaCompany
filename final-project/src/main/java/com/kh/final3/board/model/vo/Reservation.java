package com.kh.final3.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reservation {
	private int reservationNo;
	private int userNo;
	private Date revDate;
	private String reserveCategory;
	private String reserveContent;
	private String approval;
	private String status;
}
