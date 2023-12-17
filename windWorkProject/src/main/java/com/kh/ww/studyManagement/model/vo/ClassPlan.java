package com.kh.ww.studyManagement.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ClassPlan {
	private int classWeekNo;
	private String classWeek;
	private String classContent;
	private int classNo;
	private String className;
	private String classTitle;
	private String teacher;
	private String classroomName;
	private String classStartDate;
	private String classEndDate;
	private int classTotalNumber;
	private int months;
	private int classRoomNo;
	private int classPlanNo;
}
