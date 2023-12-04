package com.kh.ww.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ww.employee.model.dao.EmployeeDao;
import com.kh.ww.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int employeeApproval(Employee e) {
		return 0;
	}


	@Override
	public int insertEmployee(Employee e) {
		return employeeDao.insertEmployee(sqlSession, e);

	}


	@Override
	public Employee loginEmployee(Employee e) {
		// TODO Auto-generated method stub
		return employeeDao.loginEmployee(sqlSession, e);
	}

}
