package com.kh.ww.studyManagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ww.studyManagement.model.service.StudyManagementService;

@Controller
public class studyManagementController {
	@Autowired
	private StudyManagementService studyManagementService;
	
	
	//수업관리
	@RequestMapping("/list.st")
	public String enrollForm() {
		return "studyManagement/lessonPlan";
	}
}
