package com.kh.ww.studyManagement.model.service;

import java.util.ArrayList;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.studyManagement.model.vo.Category;
import com.kh.ww.studyManagement.model.vo.ClassAttachment;
import com.kh.ww.studyManagement.model.vo.ClassPlan;
import com.kh.ww.studyManagement.model.vo.Student;

public interface StudyManagementService {
	//강의계획표 카운트
	int planlistCount(int empNo);
	//강의 찾기
	ClassPlan studySelect(int empNo);
	//강의계획표 내용검색
	ArrayList<ClassPlan> planSelectList(int eno, PageInfo pi);
	
	//강의자료실
	int MaterialslistCount(String category);
	ArrayList<ClassAttachment> lectureMaterialslist(PageInfo pi, String category);
	ArrayList<ClassPlan> ajaxUpdateplanList(int empNo);
	ArrayList<ClassPlan> ajaxClassroomSelect();
	
	//강의계획 수정
	int updateplan(ClassPlan cp);
	int updateplanContent(ClassPlan cp);
	
	//강의 상세 페이지
	ClassAttachment selectData(int dataNo);
	ArrayList<ClassAttachment> selectDataAttachmentList(int dataNo);
	
	// 대표 자료
	ArrayList<ClassAttachment> lectureMaterialsLevellist();
	
	//강의자료 create
	int createDataroom(ClassAttachment c);
	int createDataAttachment(ClassAttachment c);
	
	//강의자료 update
	int updateDataroom(ClassAttachment c);
	int updateDataAttachment(ClassAttachment c);
	
	//즐겨찾기 리스트 불러오기
	int dataLikeCount(int empNo);
	ArrayList<ClassAttachment> dataLikeSelectList(PageInfo lmpi, int empNo);
	
	//강의자료 최대 숫자
	int selectmaxsize();
	
	//학생 리스트 카운트
	int ajaxSelectListCount(int empNo);
	
	//학생리스트 출력
	ArrayList<Student> ajaxStudentSelectList(PageInfo pi, int empNo);
	
	//강의자료 삭제
	int deleteDataAttachment(String classFileNo);
	
	//강의 자료 수정 추가
	int createUpdateDataAttachment(ClassAttachment c);
	
	//데이터 삭제
	int deleteDataroom(int classDataNo);
	
	//학생 카테고리
	ArrayList<Category> selectClassCategoryList();
	
	//학생 삭제
	int deleteStudent(int sno);
	
	//학생추가
	int ajaxSpeedinsertStudent(Student student);
	
	
	
}
