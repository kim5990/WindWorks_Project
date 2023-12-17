package com.kh.ww.reservation.model.service;

import java.util.ArrayList;

import com.kh.ww.reservation.model.vo.Assets;
import com.kh.ww.reservation.model.vo.Reservation;

public interface ReservationService {
	//재물 리스트 조회
	ArrayList<Assets> selectAssetsList();
	
	//예약된 재물 리스트 조회
	ArrayList<Reservation> selectReservationList(int empNo);
	
	//예약페이지 예약된 재물 리스트
	int selectReservationListCount();
}
