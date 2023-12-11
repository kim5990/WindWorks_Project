package com.kh.ww.community.model.vo;

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
public class CommunityAttachment {
	
	private int communityFileNo;
	private int communityBoardNo;
	private String communityOriginName;
	private String communityChangeName;
	private String communityFilePath;
	private String communityUploadDate;
	private int communityFileLevel;

}
