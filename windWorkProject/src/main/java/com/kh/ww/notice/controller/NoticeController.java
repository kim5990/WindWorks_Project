package com.kh.ww.notice.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.common.template.SaveFile;
import com.kh.ww.employee.model.vo.Employee;
import com.kh.ww.notice.model.service.NoticeService;
import com.kh.ww.notice.model.vo.Notice;
import com.kh.ww.notice.model.vo.NoticeAttachment;
import com.kh.ww.notice.model.vo.NoticeReply;

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
//		int result2 = noticeService.insertNoticeAttachment(na);
		
		if (result1 > 0) {
			session.setAttribute("alertMsg", "공지사항이 작성되었습니다.");
			return "redirect:list.no";
		} else {
			model.addAttribute("errorMsg", "공지사항 작성에 실패하였습니다.");
			return "common/noticeListView";
		}
		
	}
	
	// 공지사항 수정 이동
	@RequestMapping("updateForm.no")
	public String updateForm(int nno, Model model) {
		// 현재 내가 수정하기를 클릭한 게시글에 대한 정보를 가지고 이동
		model.addAttribute("n", noticeService.selectNotice(nno));
		return "notice/noticeUpdateForm";
	}
	
	// 공지사항 수정
	@RequestMapping("update.no")
	public String updateNotice(Notice n, MultipartFile reupfile, HttpSession session, Model model) {
		// 새로운 첨부파일 존재유무 확인
		if (!reupfile.getOriginalFilename().equals("")) {
			// 새로운 첨부파일 서버 업로드
			String changeName = SaveFile.getSaveFileInfo(reupfile, session, "resources/uploadFiles/notice/");
			// 새로운 첨부파일이 있다면 => 기존 첨부파일 삭제
			if (n.getNoticeOriginName() != null) {
				new File(session.getServletContext().getRealPath(n.getNoticeChangeName())).delete();
			}
			// n객체에 새로운 첨부파일 정보(원본명, 저장경로) 저장
			n.setNoticeOriginName(reupfile.getOriginalFilename());
			n.setNoticeChangeName("resources/uploadFiles/notice/" + changeName);
		}
		// n객체 update
		int result = noticeService.updataNotice(n);
		// 성공유무 확인 후 페이지 리턴
		if (result > 0) {
			session.setAttribute("alertMsg", "공지사항 수정이 완료되었습니다.");
			return "redirect:detail.no?nno=" + n.getNoticeNo();
		} else {
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			return "common/noticeListView";
		}
	}
	
	// 공지사항 삭제
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, String filePath, HttpSession session, Model model) {
		
		int result = noticeService.deleteNotice(nno);
		
		if (result > 0) {
			if (!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "게시글이 삭제되었습니다.");
			return "redirect:list.no";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/noticeListView";
		}
		
	}
	
	// 공지사항 댓글 리스트 조회
	@ResponseBody
	@RequestMapping(value = "rlist.no", produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int nno, HttpSession session) {
	    ArrayList<NoticeReply> list = noticeService.selectReply(nno);

	    Employee loginUser = (Employee)session.getAttribute("loginUser");

	    if (loginUser != null) {
	        Gson gson = new Gson();
	        JsonObject jsonObject = new JsonObject();
	        jsonObject.addProperty("loginUserName", loginUser.getEmpName());
	        jsonObject.addProperty("loginUser", loginUser.getEmpNo());
	       
	        
	        JsonArray replyList = new JsonArray();

	        for (NoticeReply reply : list) {
	        	if (reply.getParentReplyNo() != 0)
	        		continue;
	        		
	            JsonObject newReply = new JsonObject();
	            newReply.addProperty("noticeReplyNo", reply.getNoticeReplyNo());
	            newReply.addProperty("noticeReplyContent", reply.getNoticeReplyContent());
	            newReply.addProperty("noticeReplyCreateDate", reply.getNoticeReplyCreateDate());
	            newReply.addProperty("noticeReplyStatus", reply.getNoticeReplyStatus());
	            newReply.addProperty("empNo", reply.getEmpNo());
	            newReply.addProperty("empName", reply.getEmpName());
	            newReply.addProperty("noticeNo", reply.getNoticeNo());
	            newReply.addProperty("parentReplyNo", reply.getParentReplyNo());
	    
	            JsonArray childList = new JsonArray();
	    
	            for (NoticeReply childReply : list) {
	                if (reply.getNoticeReplyNo() == childReply.getParentReplyNo()) {
	                    JsonObject childReplyJson = new JsonObject();
	                    childReplyJson.addProperty("noticeReplyNo", childReply.getNoticeReplyNo());
	                    childReplyJson.addProperty("noticeReplyContent", childReply.getNoticeReplyContent());
	                    childReplyJson.addProperty("noticeReplyCreateDate", childReply.getNoticeReplyCreateDate());
	                    childReplyJson.addProperty("noticeReplyStatus", childReply.getNoticeReplyStatus());
	                    childReplyJson.addProperty("empNo", childReply.getEmpNo());
	                    childReplyJson.addProperty("empName", childReply.getEmpName());
	                    childReplyJson.addProperty("noticeNo", childReply.getNoticeNo());
	                    childReplyJson.addProperty("parentReplyNo", childReply.getParentReplyNo());
	            
	                    childList.add(childReplyJson);
	                }
	            }
	    
	            newReply.add("childReply", childList);
	            replyList.add(newReply);
	        }
	        
	        jsonObject.add("list", replyList);

	        return gson.toJson(jsonObject);
	    } else {
	        return "{}";
	    }
	}

	// 공지사항 댓글 작성
	@ResponseBody
	@RequestMapping(value="rinsert.no")
	public String ajaxInsertReply(NoticeReply nr) {
		int result = noticeService.insertReply(nr);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 공지사항 댓글 수정
	@ResponseBody
	@RequestMapping(value="rupdate.no")
	public String ajaxUpdateReply(NoticeReply nr) {
		int result = noticeService.updateReply(nr);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 공지사항 댓글 삭제
	@ResponseBody
	@RequestMapping(value="rdelete.no")
	public String ajaxDeleteReply(NoticeReply nr) {
		int result = noticeService.deleteReply(nr);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 공지사항 대댓글 작성
	@ResponseBody
	@RequestMapping(value="crinsert.no")
	public String ajaxInsertChildeReply(NoticeReply nr) {
		int result = noticeService.insertChildeReply(nr);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	// 공지사항 대댓글 수정
	@ResponseBody
	@RequestMapping(value="crupdate.no")
	public String ajaxUpdateChildReply(NoticeReply nr) {
		int result = noticeService.updateChildReply(nr);
		System.out.println(nr);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 공지사항 대댓글 삭제
	@ResponseBody
	@RequestMapping(value="crdelete.no")
	public String ajaxDeleteChildReply(NoticeReply nr) {
		int result = noticeService.deleteChildReply(nr);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}
