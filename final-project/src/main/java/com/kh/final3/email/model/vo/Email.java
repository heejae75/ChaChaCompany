package com.kh.final3.email.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Email {

	private int emailNo;//	EMAIL_NO	NUMBER
	private String sender;//	SENDER	VARCHAR2(50 BYTE)
	private String receiver;//	RECEIVER	VARCHAR2(50 BYTE)
	private String emailTitle;//	EMAIL_TITLE	VARCHAR2(100 BYTE)
	private String emailContent;//	EMAIL_CONTENT	VARCHAR2(1000 BYTE)
	private Date sendDate;//	SEND_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
}
