package com.kh.final3.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class item {
	private int docNo;
	private String deptCode;
	private String supplyName;
	private double supplySize;
	private int amount;
	private int price;
	private String createDate;
	private String status;
}
