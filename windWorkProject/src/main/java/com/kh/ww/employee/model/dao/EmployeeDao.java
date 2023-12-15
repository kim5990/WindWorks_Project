package com.kh.ww.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	//회원가입
	public int insertEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
	
	//로그인
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	//사원수 가져오기
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectListCount");
	}
	
	//사원 리스트 조회
	public ArrayList<Employee> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String condition, String sorting, String keyword){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		Employee e = new Employee();
		e.setCondition(condition);
		e.setSorting(sorting);
		e.setKeyword(keyword);
		return (ArrayList)sqlSession.selectList("employeeMapper.selectList", e, rowBounds);
	}
	
	//재직중인 사원수 가져오기
	public int empYCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.empYCount");
	}
	
	//미승인 사원수 가져오기
	public int empJobCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.empJobCount");
	}
	
	//인사관리 페이지에서 사원 정보 수정하기
	public int employeeUpdate(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.employeeUpdate", e);
	}
}
