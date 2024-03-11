package com.semi.festopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.festopia.model.vo.Favorite;
import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.FestivalService;
import com.semi.festopia.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private FestivalService fesService;
	
	@Autowired
	private FavoriteService favService;
	
	@GetMapping("search")
	public String search(String[] checkFes, Model model) {
		List<Festival> list = searchService.searchFestival(checkFes);
		System.out.println(checkFes);
		model.addAttribute("list", list);
		System.out.println(list);
		return "searchResult";
	}
	
	@GetMapping("favorite")
	public String favorite(String code, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails user = (UserDetails) principal;
		
		Festival festival = fesService.select(Integer.parseInt(code));
		model.addAttribute("festival", festival);
		
		// 축제코드(fesCode), 유저코드(userCode) 보내기
		Favorite vo = new Favorite();
		vo.setFesCode(Integer.parseInt(code));
		vo.setUserCode(Integer.parseInt(code));
		
		Favorite favorite = favService.select(vo);
		model.addAttribute("favorite", favorite);
		
		return "searchResult";
	}

	
	/*========== 찜 ==========*/
	@ResponseBody
	@PostMapping("/addFav")
	public boolean addFav(String code) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails user = (UserDetails) principal;
		
		Favorite vo = new Favorite();
		vo.setFesCode(Integer.parseInt(code));
		vo.setUserCode(Integer.parseInt(code));
		
		favService.insert(vo);
		
		return true;
	}

	@ResponseBody
	@PostMapping("/delFav")
	public boolean delFav(String code) {
		favService.delete(Integer.parseInt(code));
		return true;
	}

	/*========== 축제 상세 ==========*/
	@GetMapping("/festivalDetail")
	public void festivalDetail(String no, Model model) {
		model.addAttribute("vo", searchService.select(Integer.parseInt(no)));
	}

}
