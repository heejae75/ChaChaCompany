package com.kh.final3.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Approval {
	private int appNo;
	private int DocNo;
	private String deptCode;
	private String secondApprover;
	private String lastApprover;
	private String secondeDate;
	private String lastDate;
	private String returnReason;
	private String status;
}
