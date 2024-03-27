package com.semi.festopia.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.vo.Favorite;

import java.util.List;

@Repository
public class FavoriteDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public Favorite select(Favorite fav) {
		return session.selectOne("favorite.select", fav);
	}
	
	public int insert(Favorite fav) {
		return session.insert("favorite.insert", fav);
	}
	
	public int delete(int code) {
		return session.delete("favorite.delete", code);
	}

	public List<Favorite> selectFvAll(int userCode) {
		return session.selectList("favorite.fvList", userCode);
	}

}
