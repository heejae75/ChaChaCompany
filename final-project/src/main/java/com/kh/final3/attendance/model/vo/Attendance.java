package com.kh.final3.attendance.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Attendance {
	private int attRecordNo;
	private int userNo;
	private String onTime;
	private String offTime;
	private String date;
}
