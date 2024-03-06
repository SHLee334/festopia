package com.semi.festopia.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.SearchDAO;
import com.semi.festopia.model.dto.SearchDTO;
import com.semi.festopia.model.vo.Festival;

@Service
public class SearchService {
	@Autowired
	private SearchDAO dao;
	
	public List<Festival> searchFestival(SearchDTO dto) {
		//dto.getCheckFes()
		System.out.println(dto.getCheckFes()); // 없으면 null
		if(dto.getCheckFes() == null) {
			dto.setNoCategory(true);
		} 
		System.out.println(dto.getFeeStatus());
		return dao.searchFestival(dto);
	}

}
