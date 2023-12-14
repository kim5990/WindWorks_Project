package com.kh.ww.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.community.model.service.CommunityService;
import com.kh.ww.community.model.vo.Community;
import com.kh.ww.community.model.vo.CommunityAttachment;
import com.kh.ww.community.model.vo.CommunityBoard;
import com.kh.ww.community.model.vo.CommunityReply;
import com.kh.ww.employee.model.vo.Employee;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	

	// 커뮤니티 첫 화면 불러오기
	@RequestMapping("list.com")
	public ModelAndView communityList(ModelAndView mv, HttpSession session) {
		mv.setViewName("community/communityList");
		return mv;	
	}
	
	// 내 커뮤니티 조회
	@ResponseBody
	@RequestMapping(value="myComList.com", produces="application/json; charset=UTF-8")
	public String myCommunityList(HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		ArrayList<Community> comList = communityService.communityList(e);
		return new Gson().toJson(comList);
	}
	
	// 멤버 조회
	@ResponseBody
	@RequestMapping(value="memberList.com", produces="application/json; charset=UTF-8")
	public String memberList(int comNo) {
		ArrayList<Employee> memberList = communityService.memberList(comNo);
		return new Gson().toJson(memberList);	
	}
	
	
	// 보드 리스트 불러오기
	@ResponseBody
	@RequestMapping(value="boardList.com", produces="application/json; charset=UTF-8")
	public JSONObject boardList(int comNo, int cpage) {
		// 페이지정보
		PageInfo pi = Pagenation.getPageInfo(communityService.boardListCount(comNo), cpage, 10, 3);
		
		// 보드리스트 조회
		ArrayList<CommunityBoard> boardList = communityService.boardList(pi, comNo);
		JSONObject jobj = new JSONObject();
		jobj.put("boardList", boardList);
		jobj.put("pi", pi);
		return jobj;
	}

	// 커뮤니티 보드 디테일  조회
	@ResponseBody
	@RequestMapping(value="board.com", produces="application/json; charset=UTF-8")
	public JSONObject selectBoard(int bno) {
		CommunityBoard board = communityService.selectBoard(bno);
		ArrayList<CommunityAttachment> atList = communityService.boardFile(bno);
		
		JSONObject jobj = new JSONObject();
		jobj.put("board", board);
		jobj.put("atList", atList);

		return jobj;
	}
	
	// 리플, 리리플 리스트 조회
	@ResponseBody
	@RequestMapping(value="replyList.com", produces="application/json; charset=UTF-8")
	public JSONObject selectReplyList(int bno) {
		ArrayList<CommunityReply> replyList = communityService.replyList(bno);
		ArrayList<CommunityReply> reReplyList = communityService.reReplyList(bno);
		
		JSONObject jobj = new JSONObject();
		jobj.put("reList", replyList);
		jobj.put("reReList", reReplyList);	
		return jobj;	
	}
	
	// 전체 커뮤 리스트
	@ResponseBody
	@RequestMapping(value="listAll.com", produces="application/json; charset=UTF-8")
	public JSONObject communityListAll(HttpSession session) {
		ArrayList<Community> communityListAll = communityService.communityListAll();
		
		//비교용 내 커뮤 리스트
		Employee e = (Employee)session.getAttribute("loginUser");
		ArrayList<Community> communityListMy = communityService.communityList(e);
		
		JSONObject jobj = new JSONObject();
		jobj.put("allList", communityListAll);
		jobj.put("myList", communityListMy);	
		
		return jobj;	
	}
	
	// 커뮤 가입
	@ResponseBody
	@RequestMapping(value="comIn.com")
	public String communityIn(int comNo, int empNo) {
		Community c = new Community();
		c.setCommunityNo(comNo);
		c.setEmpNo(empNo);
		return  communityService.communityIn(c) > 0 ? "success" : "fail";
	}
	
	// 커뮤 탈퇴
	@ResponseBody
	@RequestMapping(value="comOut.com")
	public String communityOut(int comNo, int empNo) {
		Community c = new Community();
		c.setCommunityNo(comNo);
		c.setEmpNo(empNo);
		return communityService.communityOut(c) > 0 ? "success" : "fail";
	}
	
	// 커뮤 등록 (커뮤 + 커뮤그룹)
	@ResponseBody
	@RequestMapping(value="create.com")
	public String communityCreate(int empNo, String comName, String comPoint) {
		Community c = new Community();
		c.setEmpNo(empNo);
		c.setCommunityName(comName);
		c.setCommunityPoint(comPoint);	
		
		// 커뮤 등록
		int result = communityService.communityCreate(c);
		int result2 = 0;
		if (result > 0) {
			// 커뮤그룹 등록
			result2 = communityService.communityGroupCreate(c);
		} 
		if (result * result2 > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 커뮤 수정
	@ResponseBody
	@RequestMapping(value="update.com")
	public String communityUpdate(String comName, String comPoint, int comNo) {
		Community c = new Community();
		c.setCommunityNo(comNo);
		c.setCommunityName(comName);
		c.setCommunityPoint(comPoint);
		return communityService.communityUpdate(c) > 0 ? "success" : "fail";
	}
	
	// 커뮤 삭제
		@ResponseBody
		@RequestMapping(value="delete.com")
		public String communityDelete(int comNo) {
			Community c = new Community();
			c.setCommunityNo(comNo);
			return communityService.communityDelete(c) > 0 ? "success" : "fail";
		}
	

	
	
}

	

	
	

