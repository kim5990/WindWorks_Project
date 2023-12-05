package com.kh.ww.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.notice.model.dao.NoticeDao;
import com.kh.ww.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;

	// 공지사항 총 갯수 가져오기
	@Override
	public int selectListCount() {
		return noticeDao.selectListCount(sqlSession);
	}
	
	// 공지사항 리스트 조회
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return noticeDao.selectList(sqlSession, pi);
	}
	
	
	
	
}
