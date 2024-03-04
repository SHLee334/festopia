package com.semi.festopia.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.SearchDAO;
import com.semi.festopia.model.vo.Festival;

@Service
public class SearchService {
	@Autowired
	private SearchDAO dao;
	
	public List<Festival> searchFestival(String[] checkFes) {
		List<String> fesList = Arrays.asList(checkFes);
		System.out.println(Arrays.asList(checkFes));
		return dao.searchFestival(fesList);
	}

}
