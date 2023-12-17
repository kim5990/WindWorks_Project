package com.kh.ww.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ww.reservation.model.vo.Assets;
import com.kh.ww.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {
	
	//재물 리스트 조회
	public ArrayList<Assets> selectAssetsList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectAssetsList");
	}
	
	//예약된 재물 리스트 조회
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList", empNo);
	}
}
