package com.kh.ww.employee.model.service;

import java.util.ArrayList;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.employee.model.vo.Employee;

public interface EmployeeService {
	//가입승인서비스(update)
	int employeeApproval(Employee e);
	
	//회원가입서비스(insert)
	int insertEmployee(Employee e);
	
	//로그인서비스(login)
	Employee loginEmployee(Employee e);
	
	//총 사원수 가져오기
	int selectListCount();
	
	//사원 리스트 조회
	ArrayList<Employee> selectList(PageInfo pi, String condition, String sorting, String keyword);
	
	//재직중인 사원수 가져오기
	int empYCount();
	
	//미승인 사원수 가져오기
	int empJobCount();
	
	//인사관리 페이지에서 사원 정보 수정하기
	int employeeUpdate(Employee e);
}
