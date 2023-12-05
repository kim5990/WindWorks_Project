package com.kh.ww.notice.model.vo;

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
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int count;
	private Date noticeCreateDate;
	private String noticeStatus;
	private int empNo;
}
