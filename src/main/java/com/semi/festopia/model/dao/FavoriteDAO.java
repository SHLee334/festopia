package com.semi.festopia.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.vo.Favorite;

@Repository
public class FavoriteDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public Favorite select(Favorite fav) {
		return session.selectOne("fav.select", fav);
	}
	
	public int insert(Favorite fav) {
		return session.insert("fav.insert", fav);
	}
	
	public int delete(int code) {
		return session.delete("fav.delete", code);
	}
	
}
