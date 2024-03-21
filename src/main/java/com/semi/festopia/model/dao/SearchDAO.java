package com.semi.festopia.model.dao;

import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.dto.SearchDTO;
import com.semi.festopia.model.vo.Festival;

@Repository
public class SearchDAO {
	@Autowired
	private SqlSessionTemplate session;
	public List<Festival> searchFestival(SearchDTO fesList) {
		return session.selectList("searchMapper.searchFestival", fesList);
	}
	
	// 메인 인기축제
	public List<Festival> popularFestival(){
		return session.selectList("searchMapper.popularFestival");
	}
	
	public Festival detail(int code) {
		return session.selectOne("searchMapper.detail", code);
	}

	public int updateViewCnt(int fesCode) {
		return session.update("searchMapper.updateViewCnt", fesCode);
	}

	public List<Festival> calendarFes(String startDate) {
		return session.selectList("searchMapper.calendarFes", startDate);
	}

}
