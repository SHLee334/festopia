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
}
