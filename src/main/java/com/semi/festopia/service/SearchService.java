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
	
	// 메인페이지 조회수 순 조회
	public List<Festival> popularFestival(){
		return dao.popularFestival();
	}

	// 축제 상세페이지
	public Festival detail(int code) {
		return dao.detail(code);
	}

	// 이번달 축제
	public List<Festival> calendarFes(String startDate) {
		return dao.calendarFes(startDate);
	}
}

	