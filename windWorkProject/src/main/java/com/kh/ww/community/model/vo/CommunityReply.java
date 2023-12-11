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
public class CommunityReply {

	private int communityReplyNo;
	private int communityBoardNo;
	private int empNo;
	private String communityReplyComment;
	private String communityReplyCreateDate;
	private String communityReplyStatus;
	private int parentReplyNo;
	
	private String empName;
	private String jobName;
	
	
}
