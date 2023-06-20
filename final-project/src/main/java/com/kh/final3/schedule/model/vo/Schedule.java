package com.kh.final3.schedule.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Schedule {
	
	 private int deptSchedule_No;			//DEPT_SCHEDULE_NO NUMBER PRIMARY KEY,
     private String deptCode;				//DEPT_CODE VARCHAR2(4) NOT NULL,
     private String jobCode;				//JOB_CODE VARCHAR2(4),
     private String scheduleTitle;			//SCHEDULE_TITLE VARCHAR2(100) NOT NULL,
     private String scheduleContent;		//SCHEDULE_CONTENT VARCHAR2(300),
     private Date enrollDate;				//ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
     private Date modifyDate;
     private Date startDate;				//START_DATE DATE,
     private Date endDate;					//END_DATE DATE,
     private String status;					//STATUS VARCHAR2(1) DEFAULT 'N' CHECK(STATUS IN('N','Y')),
}
