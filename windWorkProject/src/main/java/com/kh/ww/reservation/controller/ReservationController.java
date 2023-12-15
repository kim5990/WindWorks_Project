package com.kh.ww.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.common.template.Pagenation;
import com.kh.ww.employee.model.vo.Employee;
import com.kh.ww.reservation.model.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	
	//예약페이지
	@RequestMapping("/reservationPage.re")
	public ModelAndView reservationPage(HttpSession session,@RequestParam(value="cpage", defaultValue="1") int currentPage,
			ModelAndView mv) {
		
		PageInfo pi = Pagenation.getPageInfo(reservationService.selectReservationListCount(), currentPage, 3, 4);
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		mv.addObject("assetsList", reservationService.selectAssetsList())
		  .addObject("reservationList", reservationService.selectReservationList(e.getEmpNo()))
		  .setViewName("reservation/reservation");
		return mv;
	}
}
