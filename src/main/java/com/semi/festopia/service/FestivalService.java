package com.semi.festopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.FestivalDAO;
import com.semi.festopia.model.vo.Festival;

@Service
public class FestivalService {

	@Autowired
	private FestivalDAO dao;
	
	public Festival select(int code) {
		return dao.select(code);
	}
}
