package com.kh.ww.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.notice.model.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 총 갯수, 공지사항 리스트 조회
	@RequestMapping("list.no")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(noticeService.selectListCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", noticeService.selectList(pi))
		  .setViewName("notice/noticeListView");
		
		return mv;
	}
	
	
	
	
}
