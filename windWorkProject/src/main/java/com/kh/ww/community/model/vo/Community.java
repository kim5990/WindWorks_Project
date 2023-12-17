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
public class Community {
	
	
	private int communityNo;
	private String communityName;
	private String communityPoint;
	private String communityStatus;
	
	private int empNo;

}
