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
public class ClassAttachment {
		private int classFileNo;
		private int classDataNo;
		private String classOriginName;
		private String classChangeName;
		private String classUploadDate;
		private String classFilePath;
		private String classAttachmentStatus;
		private int empNo;
		private String empName;
		private String classDataTitle;
		private String classDataContent;
		private String classDataTimeName;
		private String classDataDate;
		private String classDataStatus;
		private int categoryNo;
		private String category;
		private String jobName;
		private String deptName;
		private String classDataEndDate;
		private String profileFilePath;
		private long classFileSize;
		private int classFileLevel;
		private int classLikeNo;
}
