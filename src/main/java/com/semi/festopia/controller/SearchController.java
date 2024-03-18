package com.semi.festopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.festopia.model.dto.SearchDTO;
import com.semi.festopia.model.vo.Favorite;
import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.FestivalService;
import com.semi.festopia.service.SearchService;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private FavoriteService favService;
	
	@GetMapping("search")
	public String search(SearchDTO dto, Model model) {
		List<Festival> list = searchService.searchFestival(dto);
		model.addAttribute("list", list);
		return "searchResult";
	}
	
	@ResponseBody
	@PostMapping("/search")
	public List<Festival> search() {
		List<Festival> list = searchService.popularFestival();
		System.out.println(list);
		return list;
	}
	
	@GetMapping("viewCount")
	public String viewCount(int fesCode) {
		searchService.updateViewCnt(fesCode);
		return "redirect:/searchResult";
	}

}
