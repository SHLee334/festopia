package com.semi.festopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.FavoriteDAO;
import com.semi.festopia.model.vo.Favorite;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteDAO dao;
	
	public Favorite select(Favorite fav) {
		return dao.select(fav);
	}
	
	public int insert(Favorite fav) {
		return dao.insert(fav);
	}
	
	public int delete(int code) {
		return dao.delete(code);
	}
}
