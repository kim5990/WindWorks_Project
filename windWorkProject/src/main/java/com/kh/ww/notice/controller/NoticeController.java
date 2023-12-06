package com.kh.ww.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.common.template.SaveFile;
import com.kh.ww.notice.model.service.NoticeService;
import com.kh.ww.notice.model.vo.Notice;
import com.kh.ww.notice.model.vo.NoticeAttachment;

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
	
	// 공지사항 상세 조회
	@RequestMapping("detail.no")
	public String selectNotice(int nno, Model model) {

		int result = noticeService.increaseCount(nno);

		if (result > 0) {
			Notice n = noticeService.selectNotice(nno);
			model.addAttribute("n", n);
			
			return "notice/noticeDetailView";
		} else {
			model.addAttribute("errorMsg", "게시글 조회 실패");
			return "common/noticeListView";
		}
	}
	
	// 공지사항 작성 이동
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "notice/noticeEnrollForm";
	}
	
	// 공지사항 작성
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, NoticeAttachment na, MultipartFile upfile, HttpSession session, Model model) {
		
		// 전달된 파일이 있을 경우 => 파일명 수정 후 서버 업로드 => 원본명, 서버 업로드된 경로로 n에 담기(파일이 있을 때만)
		if (!upfile.getOriginalFilename().equals("")) {
			String changeName = SaveFile.getSaveFileInfo(upfile, session, "resources/uploadFiles/notice/");
			
			n.setNoticeOriginName(upfile.getOriginalFilename());
			n.setNoticeChangeName("resources/uploadFiles/notice/" + changeName);
		} 
		
		int result1 = noticeService.insertNotice(n);
		int result2 = noticeService.insertNoticeAttachment(na);
		
		if (result1 + result2 > 0) {
			session.setAttribute("alertMsg", "공지사항이 작성되었습니다.");
			return "redirect:list.no";
		} else {
			model.addAttribute("errorMsg", "공지사항 작성에 실패하였습니다.");
			return "common/noticeListView";
		}
		
	}
	

	
	
	
}
