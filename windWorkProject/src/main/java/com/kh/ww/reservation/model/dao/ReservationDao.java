package com.kh.ww.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.reservation.model.vo.Assets;
import com.kh.ww.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {
	
	//재물 리스트 조회
	public ArrayList<Assets> selectAssetsList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectAssetsList");
	}
	
	//예약된 재물 리스트 조회 페이지 하단
	public ArrayList<Reservation> selectReservationListPi(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationListPi", empNo);
	}
	
	//재물 예약
	public int reservationAssets(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.insert("reservationMapper.reservationAssets", r);
	}
	
	//재물 반납
	public int deleteReservation(SqlSessionTemplate sqlSession, int reserNo) {
		return sqlSession.update("reservationMapper.deleteReservation", reserNo);
	}
	
	//내 예약리스트 카운트
	public int selectReservationListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("employeeMapper.selectListCount", empNo);
	}
	
	//예약된 재물 리스트 조회 페이지 상단
		public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, int empNo){
			
			return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList", empNo);
		}
}
