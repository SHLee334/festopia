package com.semi.festopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.service.FestivalService;
import com.semi.festopia.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private FestivalService fesService;

	
	@GetMapping("search")
	public String search(String[] checkFes, Model model) {
		List<Festival> list = searchService.searchFestival(checkFes);
		System.out.println(checkFes);
		model.addAttribute("list", list);
		System.out.println(list);
		return "searchResult";
	}
	
	/*========== 축제 상세 ==========*/
	@GetMapping("/detail")
	public String detail(String code, Model model) {
		model.addAttribute("vo", searchService.detail(Integer.parseInt(code)));
		return "festivalDetail";
	}

}
