package com.kh.ww.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ww.reservation.model.dao.ReservationDao;
import com.kh.ww.reservation.model.vo.Assets;
import com.kh.ww.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//재물리스트 조회
	@Override
	public ArrayList<Assets> selectAssetsList() {
		return reservationDao.selectAssetsList(sqlSession);
	}
	
	//예약된 재물 리스트 조회
	@Override
	public ArrayList<Reservation> selectReservationList(int empNo) {
		return reservationDao.selectReservationList(sqlSession, empNo);
	}
	
	@Override
	public int selectReservationListCount() {
		return 0;
	}
	
}
