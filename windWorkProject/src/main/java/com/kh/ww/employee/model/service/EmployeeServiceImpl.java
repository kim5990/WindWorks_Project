package com.kh.ww.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.employee.model.dao.EmployeeDao;
import com.kh.ww.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//가입승인
	@Override
	public int employeeApproval(Employee e) {
		return 0;
	}

	//회원가입
	@Override
	public int insertEmployee(Employee e) {
		return employeeDao.insertEmployee(sqlSession, e);

	}

	//로그인
	@Override
	public Employee loginEmployee(Employee e) {
		return employeeDao.loginEmployee(sqlSession, e);
	}
	
	//사원수 가져오기
	@Override
	public int selectListCount() {
		return employeeDao.selectListCount(sqlSession);
	}
	
	//사원 조회
	@Override
	public ArrayList<Employee> selectList(PageInfo pi, String condition, String sorting, String keyword) {
		return employeeDao.selectList(sqlSession, pi, condition, sorting, keyword);
	}
	
	//재직중인 사원 조회
	@Override
	public int empYCount() {
		return employeeDao.empYCount(sqlSession);
	}

	//미승인 사원수 가져오기
	@Override
	public int empJobCount() {
		return employeeDao.empJobCount(sqlSession);
	}
	
	//인사관리 페이지에서 사원 정보 수정하기
	@Override
	public int employeeUpdate(Employee e) {
		return employeeDao.employeeUpdate(sqlSession, e);
	}

}
