package com.kh.ww.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SidebarController {

	
	@RequestMapping(value = "/enrollForm.me")
	public String enrollForm() {
		return "common/memberInsertForm";
	}
}
