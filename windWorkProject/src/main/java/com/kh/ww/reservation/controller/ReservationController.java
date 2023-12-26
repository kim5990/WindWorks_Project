package com.kh.ww.reservation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.community.model.vo.Community;
import com.kh.ww.employee.model.vo.Employee;
import com.kh.ww.reservation.model.service.ReservationService;
import com.kh.ww.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	
	//예약페이지
	@RequestMapping("/reservationPage.re")
	public ModelAndView reservationPage(HttpSession session, ModelAndView mv) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		JSONObject result = new JSONObject();
		result.put("assetsList", reservationService.selectAssetsList());
		result.put("reservationList", reservationService.selectReservationList(e.getEmpNo()));
		mv.addObject("result", new Gson().toJson(result))
		  .setViewName("reservation/reservation");
		return mv;
	}
	
	//재물예약
	@RequestMapping("/reservation.as")
	public String reservationAssets(Reservation r, HttpSession session, Model model) {
		
		r.setStartDateTime(r.getStartDate() + " " + r.getStartTime());
		r.setEndDateTime(r.getEndDate() + " " +r.getEndTime());
		
		System.out.println(r.getStartDateTime());
		System.out.println(r.getEndDateTime());
		
		int result = reservationService.reservationAssets(r);
		if (result > 0) {
			session.setAttribute("alertMsg", "예약 성공");
			return "redirect:/reservationPage.re";
		} else {
			model.addAttribute("alertMsg", "예약 실패");
			return "redirect:/reservationPage.re";
		}
	}
	
	//재물예약취소
	@RequestMapping("/delete.re")
	public String deleteReservation(@RequestParam(value="reserNo") int reserNo, HttpSession session, Model model) {
		
		int result = reservationService.deleteReservation(reserNo);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "반납 성공");
			return "redirect:/reservationPage.re";
		} else {
			model.addAttribute("alertMsg", "반납 실패");
			return "redirect:/reservationPage.re";
		}
	}
	
	@RequestMapping("/delete.re")
	public String deleteReservation(@RequestParam(value="reserNo") int reserNo, HttpSession session, Model model) {
		
		int result = reservationService.deleteReservation(reserNo);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "반납 성공");
			return "redirect:/reservationPage.re";
		} else {
			model.addAttribute("alertMsg", "반납 실패");
			return "redirect:/reservationPage.re";
		}
	}
	
	// 내 예약리스트 조회
	@ResponseBody
	@RequestMapping(value="myReservation.re", produces="application/json; charset=UTF-8")
	public String myCommunityList(HttpSession session) {
		Employee e = (Employee)session.getAttribute("loginUser");
		ArrayList<Community> comList = communityService.communityList(e);
		return new Gson().toJson(comList);
	}
}
