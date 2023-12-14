package com.kh.ww.studyManagement.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.employee.model.vo.Employee;
import com.kh.ww.studyManagement.model.service.StudyManagementService;
import com.kh.ww.studyManagement.model.vo.Category;
import com.kh.ww.studyManagement.model.vo.ClassAttachment;
import com.kh.ww.studyManagement.model.vo.ClassPlan;
import com.kh.ww.studyManagement.model.vo.Student;

@Controller
public class studyManagementController {
	@Autowired
	private StudyManagementService studyManagementService;
	
	//강의계획표
	@RequestMapping(value = "list.lp")
	public ModelAndView selectplanList(ModelAndView mv, HttpSession session) {
		mv.setViewName("studyManagement/lessonPlan");
		return mv;
	}
	
	//강의계획표
	@ResponseBody
	@RequestMapping(value = "ajaxlist.lp",  produces = "appalication/json; charset = UTF-8")
	public String ajaxSelectplanList(HttpSession session, @RequestParam(value="cpage", defaultValue = "1") int currentPage) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ClassPlan cp = studyManagementService.studySelect(empNo);
		int listCount = studyManagementService.planlistCount(empNo);
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, 2, 2);
		ArrayList<ClassPlan> list = studyManagementService.planSelectList(empNo ,pi);
		
		JSONObject jobj = new JSONObject();
		jobj.put("pi", pi);
		jobj.put("list", list);
		jobj.put("cp", cp);
		return new Gson().toJson(jobj);
	}
	//강의계획표 수정 폼
	@ResponseBody
	@RequestMapping(value = "ajaxupdatePlanlist.lp",  produces = "appalication/json; charset = UTF-8")
	public String ajaxUpdateplanList(HttpSession session, @RequestParam(value="cpage", defaultValue = "1") int currentPage) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ClassPlan cp = studyManagementService.studySelect(empNo);
		ArrayList<ClassPlan> rlist = studyManagementService.ajaxClassroomSelect();
		ArrayList<ClassPlan> list = studyManagementService.ajaxUpdateplanList(empNo);
		
		JSONObject jobj = new JSONObject();
		jobj.put("rlist", rlist);
		jobj.put("list", list);
		jobj.put("cp", cp);
		return new Gson().toJson(jobj);
	}
	
	//강의계획표 수정
	@RequestMapping(value = "update.lp")
	public ModelAndView updateplan(ModelAndView mv, HttpSession session, ClassPlan cp) {
		int result1 =  studyManagementService.updateplan(cp);
		int result2 =  studyManagementService.updateplanContent(cp);
		mv.setViewName("studyManagement/lessonPlan");
		return mv;
	}
	
	//강의자료실 ajax
	@ResponseBody
	@RequestMapping(value = "ajaxlist.lm",  produces = "appalication/json; charset = UTF-8")
	public String ajaxLectureMaterialslist(HttpSession session, @RequestParam(value="cpage", defaultValue = "1") int currentPage, String category) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = 0;
		PageInfo lmpi = new PageInfo();
		ArrayList<ClassAttachment> calist = new ArrayList();
		ArrayList<ClassAttachment> caLevellist = new ArrayList();
		if(category.equals("즐겨찾기")) {
			 listCount = studyManagementService.dataLikeCount(empNo);
			 lmpi = Pagenation.getPageInfo(listCount, currentPage, 3, 7);
			 calist = studyManagementService.dataLikeSelectList(lmpi, empNo);
		}else {
			 listCount = studyManagementService.MaterialslistCount(category);
			 lmpi = Pagenation.getPageInfo(listCount, currentPage, 3, 7);
			 calist = studyManagementService.lectureMaterialslist(lmpi, category);
		}
		caLevellist = studyManagementService.lectureMaterialsLevellist();
		JSONObject jobj = new JSONObject();
		jobj.put("lmpi", lmpi);
		jobj.put("calist", calist);
		jobj.put("caLevellist", caLevellist);
		return new Gson().toJson(jobj);
	}
	//강의자료실 detail
	@RequestMapping(value = "detailView.lm")
	public ModelAndView detailLectureMaterialView(ModelAndView mv, int dataNo) {
		int dataSize = studyManagementService.selectmaxsize();
		ClassAttachment c = studyManagementService.selectData(dataNo);
		ArrayList<ClassAttachment> calist = studyManagementService.selectDataAttachmentList(dataNo);
		mv.addObject("c",c)
			.addObject("calist", calist)
			.addObject("dataSize", dataSize)
			.setViewName("studyManagement/lectureMaterialsDetailView");
		return mv;
	}
	
	//강의자료실 작성하기 폼
	@RequestMapping(value = "createForm.lm")
	public ModelAndView createDataView(ModelAndView mv, int empNo) {
		mv.addObject("empNo",empNo);
		mv.setViewName("studyManagement/createLectureMaterials");	
		return mv;
	}
	
	//강의 작성
	@RequestMapping(value = "create.lm")
	public ModelAndView createDataroom(ModelAndView mv, HttpSession session, ClassAttachment c, MultipartHttpServletRequest file) {
		List<MultipartFile> fileList = file.getFiles("files");
		int result1 = studyManagementService.createDataroom(c);
		int result2 = 0;
		int i = 1;
		for(MultipartFile f : fileList) {
			System.out.println(f);
			if(!f.getOriginalFilename().equals("") && i == 1) {
				String changeName = getSaveFileInfo(f, session, "resources/uploadFiles/classRoomData/");
				c.setClassOriginName(f.getOriginalFilename());
				c.setClassChangeName(changeName);
				c.setClassFileSize(f.getSize()/1024);
				c.setClassFilePath("resources/uploadFiles/employee/"+ changeName);
				c.setClassFileLevel(i);
				result2 = studyManagementService.createDataAttachment(c);
				i = 0;
			}else if(!f.getOriginalFilename().equals("") && i == 0){
				String changeName = getSaveFileInfo(f, session, "resources/uploadFiles/classRoomData/");
				c.setClassOriginName(f.getOriginalFilename());
				c.setClassChangeName(changeName);
				c.setClassFileSize(f.getSize());
				c.setClassFilePath("resources/uploadFiles/employee/"+ changeName);
				c.setClassFileLevel(i);
				result2 = studyManagementService.createDataAttachment(c);
			}
		}
		if((result1 * result2) == 1) {
			mv.setViewName("studyManagement/createLectureMaterials");	
		}
		return mv;
	}
	
	//강의 수정 페이지 이동
	@RequestMapping(value = "updateFormView.lm")
	public ModelAndView updateDataroomView(ModelAndView mv, int classDataNo) {
		ClassAttachment c = studyManagementService.selectData(classDataNo);
		ArrayList<ClassAttachment> calist = studyManagementService.selectDataAttachmentList(classDataNo);
		mv.addObject("c",c)
		.addObject("calist", calist)
		.setViewName("studyManagement/updateLectureMaterials");
		return mv;
	}
	
	//강의 수정 페이지 이동
	@RequestMapping(value = "update.lm")
	public String updateDataroom(ModelAndView mv, ClassAttachment c, String[] filePath, String[] fileNo,HttpSession session, MultipartHttpServletRequest reupfiles) {
		List<MultipartFile> fileList = reupfiles.getFiles("reupfiles");
		int result1 = studyManagementService.updateDataroom(c);
		int result2 = 0;
		int i = 1;
		
		if(fileList.size() > 0) {
			if(filePath.length > 0) {
				for(String s : filePath) {
					new File(session.getServletContext().getRealPath(s)).delete();
				}
				
				for(String fn : fileNo) {
					int num = studyManagementService.deleteDataAttachment(fn);
				}
		}
			
			for(MultipartFile f : fileList) {
				if(!f.getOriginalFilename().equals("") && i == 1) {
					String changeName = getSaveFileInfo(f, session, "resources/uploadFiles/classRoomData/");

					c.setClassOriginName(f.getOriginalFilename());
					c.setClassChangeName(changeName);
					c.setClassFileSize(f.getSize()/1024);
					c.setClassFilePath("resources/uploadFiles/employee/"+ changeName);
					c.setClassFileLevel(i);
					result2 = studyManagementService.createUpdateDataAttachment(c);
					i = 0;
				}else if(!f.getOriginalFilename().equals("") && i == 0){
					String changeName = getSaveFileInfo(f, session, "resources/uploadFiles/classRoomData/");
					
					c.setClassOriginName(f.getOriginalFilename());
					c.setClassChangeName(changeName);
					c.setClassFileSize(f.getSize());
					c.setClassFilePath("resources/uploadFiles/employee/"+ changeName);
					c.setClassFileLevel(i);
					result2 = studyManagementService.createUpdateDataAttachment(c);
				}
			}
		}
		System.out.println(c.getClassDataNo());
		return "redirect:/detailView.lm?dataNo="+ c.getClassDataNo();
	}
	
	//강의자료 페이지 삭제
	@RequestMapping(value = "delete.lm")
	public String deleteDataroom(HttpSession session, int classDataNo) {
		int result = studyManagementService.deleteDataroom(classDataNo);
		ArrayList<ClassAttachment> calist = studyManagementService.selectDataAttachmentList(classDataNo);
		if(calist.size() > 0) {
			for(ClassAttachment c : calist) {
				new File(session.getServletContext().getRealPath(c.getClassFilePath())).delete();
				int num = studyManagementService.deleteDataAttachment(Integer.toString(c.getClassFileNo()));
			}
		}
		
		return "studyManagement/lessonPlan";
	}
	
	//학생 관리 폼
	@ResponseBody
	@RequestMapping(value = "ajaxSelectList.stm",  produces = "appalication/json; charset = UTF-8")
	public String ajaxStudentSelectList( HttpSession session,  @RequestParam(value="cpage", defaultValue = "1") int currentPage, @RequestParam(value="boardLimit", defaultValue = "10") int boardLimit) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		System.out.println(boardLimit);
		int listCount = studyManagementService.ajaxSelectListCount(empNo);
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, 3, boardLimit);
		ArrayList<Category> classroomList = studyManagementService. selectClassCategoryList();
		ArrayList<Student> studentList = studyManagementService.ajaxStudentSelectList(pi, empNo);
		JSONObject jobj = new JSONObject();
		jobj.put("pi", pi);
		jobj.put("classroomList", classroomList);
		jobj.put("listCount", listCount);
		jobj.put("boardLimit", boardLimit);
		jobj.put("studentList", studentList);
		return new Gson().toJson(jobj);
	}

	//학생 삭제 폼
	@ResponseBody
	@RequestMapping(value = "deleted.stm",  produces = "appalication/json; charset = UTF-8")
	public String ajaxStudentDeleteList(HttpSession session,  @RequestParam(value="studentNoList[]") List<Integer> studentNoList, @RequestParam(value="cpage", defaultValue = "1") int currentPage, @RequestParam(value="boardLimit", defaultValue = "10") int boardLimit) {
		for(int sno : studentNoList) {
			int result = studyManagementService.deleteStudent(sno);
			if(result < 1) {
				System.out.println("학생 삭제 실패");
			}
		}
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = studyManagementService.ajaxSelectListCount(empNo);
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, 3, boardLimit);
		ArrayList<Category> classroomList = studyManagementService. selectClassCategoryList();
		ArrayList<Student> studentList = studyManagementService.ajaxStudentSelectList(pi, empNo);
		
		JSONObject jobj = new JSONObject();
		jobj.put("pi", pi);
		jobj.put("classroomList", classroomList);
		jobj.put("listCount", listCount);
		jobj.put("studentList", studentList);
		return new Gson().toJson(jobj);
	}
	
	//학생추가 폼
	@ResponseBody	
	@RequestMapping(value = "ajaxaddSelectList.stm",  produces = "appalication/json; charset = UTF-8")
	public String ajaxSpeedinsertStudent(HttpSession session, Student student,
										@RequestParam(value="cpage", defaultValue = "1") int currentPage, @RequestParam(value="boardLimit", defaultValue = "10") int boardLimit) {
		System.out.println(student);
		int result = studyManagementService.ajaxSpeedinsertStudent(student);
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = studyManagementService.ajaxSelectListCount(empNo);
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, 3, boardLimit);
		ArrayList<Category> classroomList = studyManagementService. selectClassCategoryList();
		ArrayList<Student> studentList = studyManagementService.ajaxStudentSelectList(pi, empNo);
		JSONObject jobj = new JSONObject();
		jobj.put("pi", pi);
		jobj.put("classroomList", classroomList);
		jobj.put("listCount", listCount);
		jobj.put("studentList", studentList);
		return new Gson().toJson(jobj);
	}
	
	//학생 추가 폼
	@RequestMapping(value = "insertFormView.stm")
	public String insertStudentForm() {
		return "studyManagement/studentInsertForm";
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
	
}
