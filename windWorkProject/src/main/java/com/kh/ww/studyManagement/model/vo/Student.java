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
public class Student {
	private int studentNo;
	private int classNo;
	private String className;
	private String classroomNo;
	private String classroomName;
	private String studentName;
	private String studentPhone;
	private String studentEmail;
	private String studentAddress;
	private String studentBirth;
	private String studentGender;
	private String studentMemo;
	private String studentProfilePath;
	private String studentAttemdemce;
	private Date studentEnrolldate;
	private Date studentModifydate;
	private String studentStatus;
	private String minUnicodeNum;
	private String maxUnicodeNum;
	private String searchSelect;
	private String searchbarInput;
}
