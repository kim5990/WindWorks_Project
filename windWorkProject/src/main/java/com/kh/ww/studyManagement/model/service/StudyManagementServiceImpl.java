package com.kh.ww.studyManagement.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ww.studyManagement.model.dao.StudyManagementDao;

@Service
public class StudyManagementServiceImpl implements StudyManagementService {
	@Autowired
	private StudyManagementDao studyManagementDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
