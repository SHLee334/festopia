package com.semi.festopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.FavoriteDAO;
import com.semi.festopia.model.vo.Favorite;

import java.util.List;

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

	public List<Favorite> selectFvAll(int userCode) {
		//System.out.println("service" + userCode);
		return dao.selectFvAll(userCode);
	}

	// 축제 조회 수
	public int updateViewCnt(int fesCode){
		return dao.updateViewCnt(fesCode);
	}
}
