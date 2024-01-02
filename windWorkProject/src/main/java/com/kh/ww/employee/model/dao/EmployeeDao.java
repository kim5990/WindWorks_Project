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
	
	//온라인 상태 변경
	public int updateOnline(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateOnline", e);
	}
	
	//오프라인 상태 변경
	public int updateOffline(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateOffline", e);
	}
	
	//자리비움 상태 변경
	public int updateAway(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateAway", e);
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
	
	//회원정보수정
	public int updateEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateEmployee", e);
	}
	
	//출근상태로 변경
	public int statusWork(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.update("employeeMapper.statusWork", empNo);
	}
	
	//퇴근상태로 변경
	public int statusLeave(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.update("employeeMapper.statusLeave", empNo);
	}
	
	// 출퇴근상태 확인
	//미승인 사원수 가져오기
	public int selectStatus(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("employeeMapper.selectStatus", empNo);
	}
	
	
	
	
	
}
