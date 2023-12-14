package com.kh.ww.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.community.model.dao.CommunityDao;
import com.kh.ww.community.model.vo.Community;
import com.kh.ww.community.model.vo.CommunityAttachment;
import com.kh.ww.community.model.vo.CommunityBoard;
import com.kh.ww.community.model.vo.CommunityReply;
import com.kh.ww.employee.model.vo.Employee;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommunityDao communityDao;
	

	
	@Override
	public ArrayList<Community> communityList(Employee e) {
		return communityDao.communityList(sqlSession, e);
	}
	
	@Override
	public ArrayList<Employee> memberList(int comNo) {
		return communityDao.memberList(sqlSession, comNo);
	}
	
	@Override
	public int boardListCount(int comNo) {
		return communityDao.boardListCount(sqlSession, comNo);
	}

	@Override
	public ArrayList<CommunityBoard> boardList(PageInfo pi, int comNo) {
		return communityDao.boardList(sqlSession, pi, comNo);
	}

	@Override
	public CommunityBoard selectBoard(int bno) {
		return communityDao.selectBoard(sqlSession, bno);
	}
	
	@Override
	public ArrayList<CommunityAttachment> boardFile(int bno) {
		return communityDao.boardFile(sqlSession, bno);
	}

	@Override
	public ArrayList<CommunityReply> replyList(int bno) {
		return communityDao.replyList(sqlSession, bno);
	}

	@Override
	public ArrayList<CommunityReply> reReplyList(int bno) {
		return communityDao.reReplyList(sqlSession, bno);
	}

	@Override
	public ArrayList<Community> communityListAll() {
		return communityDao.communityListAll(sqlSession);
	}

	@Override
	public int communityIn(Community c) {
		return communityDao.communityIn(sqlSession, c);
	}

	@Override
	public int communityOut(Community c) {
		return communityDao.communityOut(sqlSession, c);
	}

	@Override
	public int communityCreate(Community c) {
		return communityDao.communityCreate(sqlSession, c);
	}

	@Override
	public int communityGroupCreate(Community c) {
		return communityDao.communityGroupCreate(sqlSession, c);
	}

	@Override
	public int communityUpdate(Community c) {
		return communityDao.communityUpdate(sqlSession, c);
	}

	@Override
	public int communityDelete(Community c) {
		return communityDao.communityDelete(sqlSession, c);
	}








}
