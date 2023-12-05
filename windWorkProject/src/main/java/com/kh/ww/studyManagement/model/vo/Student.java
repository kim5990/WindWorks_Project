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
	private int studentNO;
	private String className;
	private String studentName;
	private String studentPhone;
	private String studentEmail;
	private String studentAddress;
	private Date studentBirth;
	private String studentGender;
	private String studentMemo;
	private String studentProfilePath;
	private Date studentEnrolldate;
	private Date studentModifydate;
	private String studentStatus;
	
}
