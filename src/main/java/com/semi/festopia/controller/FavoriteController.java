package com.semi.festopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.festopia.model.vo.Favorite;
import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.SearchService;

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService favService;
	
	@Autowired
	private SearchService searchService;
	
	/*========== 축제 상세 ==========*/
	@GetMapping("/detail")
	public String detail(String code, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User) principal;
		
		model.addAttribute("vo", searchService.detail(Integer.parseInt(code)));
		
		// 축제코드(fesCode), 유저코드(userCode) 보내기
		Favorite vo = new Favorite();
		vo.setFesCode(Integer.parseInt(code));
		vo.setUserCode(user.getUserCode());
		
		Favorite favorite = favService.select(vo);	
		System.out.println(favorite);
		model.addAttribute("favorite", favorite);
		
		return "festivalDetail";
	}
	
	@ResponseBody
	@PostMapping("/addFav")
	public boolean addFav(String code) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User) principal;
		
		Favorite vo = new Favorite();
		vo.setFesCode(Integer.parseInt(code));
		vo.setUserCode(user.getUserCode());

		favService.insert(vo);

		return true;
	}

	@ResponseBody
	@PostMapping("/delFav")
	public boolean delFav(String code) {
		favService.delete(Integer.parseInt(code));
		return true;
	}
}
