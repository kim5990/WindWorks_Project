package com.kh.ww.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ww.common.model.vo.PageInfo;
import com.kh.ww.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	// 공지사항 총 갯수 가져오기
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	// 공지사항 리스트 조회
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

}
