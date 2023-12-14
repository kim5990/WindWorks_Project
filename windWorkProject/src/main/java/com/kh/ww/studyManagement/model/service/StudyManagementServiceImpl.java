package com.kh.ww.studyManagement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.studyManagement.model.dao.StudyManagementDao;
import com.kh.ww.studyManagement.model.vo.Category;
import com.kh.ww.studyManagement.model.vo.ClassAttachment;
import com.kh.ww.studyManagement.model.vo.ClassPlan;
import com.kh.ww.studyManagement.model.vo.Student;

@Service
public class StudyManagementServiceImpl implements StudyManagementService {
	@Autowired
	private StudyManagementDao studyManagementDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//강의계획표 주 갯수
	@Override
	public int planlistCount(int empNo) {

		return studyManagementDao.planlistCount(sqlSession, empNo);
	}
	//강의계획표 리스트
	@Override
	public ArrayList<ClassPlan> planSelectList(int empNo, PageInfo pi) {
		return studyManagementDao.planSelectList(sqlSession, empNo, pi);
	}
	//ajax모달 수정창 보여주기
	@Override
	public ArrayList<ClassPlan> ajaxUpdateplanList(int empNo) {
		return studyManagementDao.ajaxUpdateplanList(sqlSession, empNo);
	}
	
	//강의실 리스트 조회
	@Override
	public ArrayList<ClassPlan> ajaxClassroomSelect() {
		return studyManagementDao.ajaxClassroomSelect(sqlSession);
	}
	//강의 검색
	@Override
	public ClassPlan studySelect(int empNo) {
		return studyManagementDao.studySelect(sqlSession, empNo);
	}
	
	//강의자료실 리스트 카운트
	@Override
	public int MaterialslistCount(String category) {
		return studyManagementDao.MaterialslistCount(sqlSession, category);
	}
	//강의자료실리스트 조회
	@Override
	public ArrayList<ClassAttachment> lectureMaterialslist(PageInfo pi, String category) {
		return studyManagementDao.lectureMaterialslist(sqlSession, pi, category);
	}
	
	//강의계획표 수정
	@Override
	public int updateplan(ClassPlan cp) {
		return studyManagementDao.updateplan(sqlSession, cp);
	}
	
	//강의계획표 내용 수정
	@Override
	public int updateplanContent(ClassPlan cp) {
		return studyManagementDao.updateplanContent(sqlSession, cp);
	}
	
	//강의자료 조회
	@Override
	public ClassAttachment selectData(int dataNo) {
		return studyManagementDao.selectData(sqlSession, dataNo);
	}
	
	//강의자료 첨부파일리스트 조회
	@Override
	public ArrayList<ClassAttachment> selectDataAttachmentList(int dataNo) {
		return studyManagementDao.selectDataAttachmentList(sqlSession, dataNo);
	}
	//대표자료 검색
	@Override
	public ArrayList<ClassAttachment> lectureMaterialsLevellist() {
		return studyManagementDao.lectureMaterialsLevellist(sqlSession);
	}
	
	//강의자료 insert
	@Override
	public int createDataroom(ClassAttachment c) {
		return studyManagementDao.createDataroom(sqlSession, c);
	}

	@Override
	public int createDataAttachment(ClassAttachment c) {
		return studyManagementDao.createDataAttachment(sqlSession, c);
	}
	
	//강의자료 즐겨찾기 찾기
	@Override
	public int dataLikeCount(int empNo) {
		return studyManagementDao.dataLikeCount(sqlSession, empNo);
	}
	
	@Override
	public ArrayList<ClassAttachment> dataLikeSelectList(PageInfo lmpi, int empNo) {
		return studyManagementDao.dataLikeSelectList(sqlSession, lmpi, empNo);
	}
	
	//강의자료 수정
	@Override
	public int updateDataroom(ClassAttachment c) {
		return studyManagementDao.updateDataroom(sqlSession, c);
	}
	@Override
	public int updateDataAttachment(ClassAttachment c) {
		return studyManagementDao.updateDataAttachment(sqlSession, c);
	}
	
	//강의자료 최대 숫
	@Override
	public int selectmaxsize() {
		return studyManagementDao.selectmaxsize(sqlSession);
	}
	
	//학생 리스트 카운트
	@Override
	public int ajaxSelectListCount(int empNo) {
		return studyManagementDao.ajaxSelectListCount(sqlSession, empNo);
	}
	//학생 리스트 추출
	@Override
	public ArrayList<Student> ajaxStudentSelectList(PageInfo pi, int empNo) {
		return studyManagementDao.ajaxStudentSelectList(sqlSession, empNo, pi);
	}
	
	//강의자료 삭제
	@Override
	public int deleteDataAttachment(String classFileNo) {
		return studyManagementDao.deleteDataAttachment(sqlSession, classFileNo);
	}
	
	@Override
	public int deleteDataroom(int classDataNo) {
		return studyManagementDao.deleteDataroom(sqlSession, classDataNo);
	}
	//강의자료 추가
	@Override
	public int createUpdateDataAttachment(ClassAttachment c) {
		return studyManagementDao.createUpdateDataAttachment(sqlSession, c);
	}

	
	//강의실 정보 불러오기
	@Override
	public ArrayList<Category> selectClassCategoryList() {
		return studyManagementDao.selectClassCategoryList(sqlSession);
	}
	
	//학생 삭제
	@Override
	public int deleteStudent(int sno) {
		return studyManagementDao.deleteStudent(sqlSession, sno);
	}
	
	//학생 추가
	@Override
	public int ajaxSpeedinsertStudent(Student student) {
		return studyManagementDao.ajaxSpeedinsertStudent(sqlSession, student);
	}
	

	


}
