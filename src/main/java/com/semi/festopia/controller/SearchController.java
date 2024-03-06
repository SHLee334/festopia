package com.semi.festopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.festopia.model.dto.SearchDTO;
import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService service;
	
	@GetMapping("search")
	public String search(SearchDTO dto, Model model) {
		System.out.println(dto);
		List<Festival> list = service.searchFestival(dto);
		model.addAttribute("list", list);
		return "searchResult";
	}

}
