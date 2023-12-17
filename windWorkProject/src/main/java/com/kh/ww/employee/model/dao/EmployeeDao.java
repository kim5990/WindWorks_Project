package com.kh.ww.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ww.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	//회원가입
	public int insertEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
	
	//로그인
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	//회원정보수정
	public int updateEmployee(SqlSessionTemplate sqlSession, Employee e) {
		// TODO Auto-generated method stub
		return sqlSession.update("employeeMapper.updateEmployee", e);
	}
}
