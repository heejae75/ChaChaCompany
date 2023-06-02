package com.kh.final3.Approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApprovalDoc {
	private int docNo;
	private String deptCode;
	private String docType;
	private String docWriter;
	private String docTitle;
	private String createDate;
	private String status;
}
