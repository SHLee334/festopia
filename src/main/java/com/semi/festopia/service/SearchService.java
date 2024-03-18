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

		System.out.println("service : " + dto.getCheckFesCate());
		if(dto.getCheckFesCate() == null) {
			dto.setNoCategory(true);
		} 
		if(dto.getCheckFeeStatus() == null) {
			dto.setFreeOrNo(true);
		}
		return dao.searchFestival(dto);
	}
	
	public List<Festival> popularFestival(){
		return dao.popularFestival();
	}
	
	public Festival detail(int code) {
		return dao.detail(code);
	}

	public int updateViewCnt(int fesCode){
		return dao.updateViewCnt(fesCode);
	}
}

	