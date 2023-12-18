package com.kh.ww.community.model.vo;

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
public class CommunityBoard {
	
	private int communityBoardNo;
	private int communityNo;
	private int empNo;
	private String communityBoardTitle;
	private String communityBoardContent;
	private int communityBoardCount;
	private String communityBoardCreateDate;
	private String communityBoardStatus;
	private int communityBoardReplyCount;
	private int communityBoardLikeCount;
	
	private String empName;
	private String profileFilePath;
	private String jobName;

}
