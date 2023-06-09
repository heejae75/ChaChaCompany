package com.kh.final3.common.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int boardNo;
	private String boardWriter;
	private String categoryCode;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int count;
	private String status;
	private String bookmark;
	private String importanceLevel;
	private String deptName;
}
