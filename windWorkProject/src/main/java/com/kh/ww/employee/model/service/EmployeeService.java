package com.kh.ww.employee.model.service;

import com.kh.ww.employee.model.vo.Employee;

public interface EmployeeService {
	//가입승인서비스(update)
	int employeeApproval(Employee e);
	
	//회원가입서비스(insert)
	int insertEmployee(Employee e);
	
	//로그인서비스(login)
	Employee loginEmployee(Employee e);
}
