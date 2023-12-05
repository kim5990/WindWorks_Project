package com.kh.ww.notice.model.service;

import java.util.ArrayList;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.notice.model.vo.Notice;

public interface NoticeService {
	
	// 공지사항 총 갯수 가져오기
	int selectListCount();
	
	// 공지사항 리스트 조회
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 공지사항 작성
	
	// 공지사항 상세 조회
	
	// 공지사항 조회수 증가
	
	// 공지사항 수정
	
	// 공지사항 삭제
	
	// 공지사항 댓글 리스트 조회
	
	// 공지사항 댓글 작성
	
	// 공지사항 댓글 수정
	
	// 공지사항 댓글 삭제
	
	// 공지사항 대댓글 작성
	
	// 공지사항 대댓글 수정
	
	// 공지사항 대댓글 삭제

}
