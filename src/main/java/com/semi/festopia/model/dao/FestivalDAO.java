package com.semi.festopia.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.vo.Festival;

@Repository
public class FestivalDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public Festival select(int code) {
		return session.selectOne("fes.select", code);
	}
}
