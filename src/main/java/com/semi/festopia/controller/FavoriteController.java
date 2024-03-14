package com.semi.festopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.festopia.model.vo.Favorite;
import com.semi.festopia.model.vo.Festival;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.FestivalService;

public class FavoriteController {

	@Autowired
	private FestivalService fesService;
	
	@Autowired
	private FavoriteService favService;
	

	@GetMapping("festivalDetail")
	public String favorite(String code, Model model) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails user = (UserDetails) principal;

		Festival festival = fesService.select(Integer.parseInt(code));
		System.out.println(festival);
		model.addAttribute("festival", festival);

		// 축제코드(fesCode), 유저코드(userCode) 보내기
		Favorite vo = new Favorite();
		vo.setFesCode(Integer.parseInt(code));
		vo.setUserCode(Integer.parseInt(code));

		Favorite favorite = favService.select(vo);		
		model.addAttribute("favorite", favorite);

		return "festivalDetail";
	}

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
}
