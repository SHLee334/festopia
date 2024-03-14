package com.semi.festopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.festopia.model.dto.SearchDTO;
import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.service.FestivalService;
import com.semi.festopia.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	

	
	@GetMapping("search")
	public String search(SearchDTO dto, Model model) {
		List<Festival> list = service.searchFestival(dto);
		model.addAttribute("list", list);
		return "searchResult";
	}
	
	@ResponseBody
	@PostMapping("/search")
	public List<Festival> search() {
		List<Festival> list = service.popularFestival();
		System.out.println(list);
		return list;
	}
	
	
	
	/*========== 축제 상세 ==========*/
	@GetMapping("/detail")
	public String detail(String code, Model model) {
		model.addAttribute("vo", service.detail(Integer.parseInt(code)));
		return "festivalDetail";
	}

}
