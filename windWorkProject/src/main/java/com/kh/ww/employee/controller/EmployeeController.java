package com.kh.ww.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.employee.model.service.EmployeeService;
import com.kh.ww.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//홈이동
	@RequestMapping("/homeForm.em")
	public String homeForm() {
		return "redirect:/";
	}
	
	//회원가입 창
	@RequestMapping("/enrollForm.em")
	public String enrollForm() {
		return "common/memberInsertForm";
	}
	
	//회원가입
	@RequestMapping("/insert.em")
	public String insertMember(Employee e, HttpServletRequest request,HttpSession session, Model model,  MultipartFile upfile) {
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = getSaveFileInfo(upfile, session, "resources/uploadFiles/employee/");
			e.setProfileFilePath("resources/uploadFiles/employee/"+ changeName);
		}
		
		e.setEmpEmail(request.getParameter("empEmail1") + "@" + request.getParameter("empEmail2"));
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
	
	//로그인
	@RequestMapping("/login.em")
	public ModelAndView loginMember(Employee e, ModelAndView mv, HttpSession session) {
		Employee loginUser = employeeService.loginEmployee(e); //아이디로만 맴버 객체 가져오기

		if(loginUser == null || !bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) { //로그인실패 => 에러문구를 requsetScope에 담고 에러페이지 포워딩
			mv.addObject("error", "로그인 실패");
			mv.setViewName("common/login");
		}else {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/logout.em")
	public ModelAndView logoutMember(ModelAndView mv, HttpSession session) {
		//session.invalidate();
		session.removeAttribute("loginUser");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	//인사관리페이지
	@RequestMapping("/approval.em")
	public ModelAndView employeeList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			@RequestParam(value="condition", defaultValue="empNo") String condition,
			@RequestParam(value="sorting", defaultValue="desc") String sorting,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			ModelAndView mv) {

		PageInfo pi = Pagenation.getPageInfo(employeeService.selectListCount(), currentPage, 3, 16);

		mv.addObject("pi",pi)
		  .addObject("sorting", sorting)
		  .addObject("condition", condition)
		  .addObject("keyword",keyword)
		  .addObject("list", employeeService.selectList(pi,condition,sorting,keyword))
		  .addObject("empConut", employeeService.empYCount())
		  .addObject("empJobCount", employeeService.empJobCount())
		  .setViewName("personManage/personManage");
		
		return mv;
	}
	
	//인사관리페이지 사원 정보 수정
	@RequestMapping("/emUpdate.em")
	public String updateMember(Employee e, HttpSession session, Model model) {
		
		int result = employeeService.employeeUpdate(e);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "회원정보 수정 성공");
			return "redirect:/approval.em";
		} else {
			model.addAttribute("alertMsg", "회원정보 수정 실패");
			return "redirect:/approval.em";
		}
	}

	//마이페이지 폼
	@RequestMapping("/myPageForm.em")
	public String InsertForm() {
		return "common/myPage";
	}
	
	//정보수정
	@RequestMapping("/update.em")
	public String employeeUpdate(Employee e, HttpServletRequest request,HttpSession session, Model model,  MultipartFile reupfile) {
		if(!reupfile.getOriginalFilename().equals("")) {
			String changeName = getSaveFileInfo(reupfile, session, "resources/uploadFiles/employee/");
			if(e.getProfileFilePath() != null) {
				new File(session.getServletContext().getRealPath(e.getProfileFilePath())).delete();
			}		
			
			e.setProfileFilePath("resources/uploadFiles/employee/"+ changeName);	
		}
		
		int result = employeeService.updateEmployee(e);
		Employee loginUser = employeeService.loginEmployee(e); //아이디로만 맴버 객체 가져오기
		session.setAttribute("loginUser", loginUser);
		return "common/myPage";
	}
	
	//아이디 비번찾기
	@RequestMapping("/idPwdFindForm.em")
	public String idPwdFindForm() {
		return "common/empIDPWDFind";
	}
	
	public String getSaveFileInfo(MultipartFile upfile, HttpSession session, String path) {
	      // 파일명 수정 후 서버 업로드 시키기("이미지저장용 (2).jpg" => 20231109102712345.jpg)
	      // 년월일시분초 + 랜덤숫자 5개 + 확장자

	      // 원래 파일명
	      String originName = upfile.getOriginalFilename();

	      // 시간정보 (년월일시분초)
	      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

	      // 랜덤숫자 5자리
	      int ranNum = (int) (Math.random() * 90000) + 10000;

	      // 확장자
	      String ext = originName.substring(originName.lastIndexOf("."));

	      // 변경된이름
	      String changeName = currentTime + ranNum + ext;

	      // 첨부파일 저장할 폴더의 물리적인 경우
	      String savePath = session.getServletContext().getRealPath(path);
	      try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	      return changeName;
	}

	
>>>>>>> adca392169ba4083e54653ed3d2a33ad24314746
}
