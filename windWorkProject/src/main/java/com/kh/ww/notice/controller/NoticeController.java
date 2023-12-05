package com.kh.ww.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ww.notice.model.service.NoticeService;

public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list.no")
	public ModelAndView selectList(@RequestParam(value="capge", defalutValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(noticeService.selectListCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", noticeService.selectList(pi))
		
	}
	
	
}
