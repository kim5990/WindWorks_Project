package com.kh.ww.studyManagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.ww.studyManagement.model.service.StudyManagementService;

@Controller
public class studyManagementController {
	@Autowired
	private StudyManagementService studyManagementService;
}
