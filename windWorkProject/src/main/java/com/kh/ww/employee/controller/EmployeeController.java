package com.kh.ww.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ww.employee.model.service.EmployeeService;
import com.kh.ww.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//회원가입 폼
	@RequestMapping(value = "/enrollForm.me")
	public String enrollForm() {
		return "common/memberInsertForm";
	}
	
	//회원가입
	@RequestMapping("/insert.em")
	public String insertMember(Employee e, HttpSession session, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		
		e.setEmpPwd(encPwd);
		
		int result = employeeService.insertEmployee(e);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	
	//로그인 폼
	@RequestMapping(value = "/login.me")
	public ModelAndView loginMember(Employee e, ModelAndView mv, HttpSession session) {

		//암호화 작업전

		//Member m의 userId : 사용자가 입력한 아이디
		//		m의 userPwd : 사용자가 입력한 비밀번호
		Employee loginUser = employeeService.loginEmployee(e); //아이디로만 맴버 객체 가져오기
		
		//logiUser userId : 아이디로 호출한 데이터베이스에서 가져온 아이디
		//loginUser userPwd : 아이디로 호출한 데이터베이스에서 가져온 비번번호
		
		//bCryptPassWordEncoder객체 matches()
		//matches(평문, 암호문)을 작성하면 내부적으로 복호화등의 작업이 이루어짐
		//두 구문이 일치하는지 확인 한 일치하면 true반환
		
		if(loginUser == null || !bCryptPassWordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) { //로그인실패 => 에러문구를 requsetScope에 담고 에러페이지 포워딩
			mv.addObject("error", "로그인 실패");
			mv.setViewName("common/errorPage");
		}else {	//로그인 성공 => sessionScope에 로그인 유저 담아서 메인으로 url재요청
			
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	
}
