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

		if(dto.getCheckFesCate() == null) {
			dto.setNoCategory(true);
		} 
		if(dto.getCheckFeeStatus() == null) {
			dto.setFreeOrNo(true);
		}
		return dao.searchFestival(dto);
	}

}

	