package com.kh.final3.attendance.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceRecord {
	private int userNo;
	private Date onTime;
	private Date offTime;
}
