package com.semi.festopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.semi.festopia.model.vo.Comment;
import com.semi.festopia.model.vo.Favorite;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.CommentService;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.SearchService;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService favService;

	@Autowired
	private SearchService searchService;

	@Autowired
	private CommentService comService;

	/* ========== 축제 상세 ========== */
	@GetMapping("/detail")
	public String detail(String code, Model model) {

		model.addAttribute("vo", searchService.detail(Integer.parseInt(code)));

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		// 축제코드(fesCode), 유저코드(userCode) 보내기
		if (!principal.equals("anonymousUser")) {
			User user = (User) principal;
			Favorite vo = new Favorite();
			vo.setFesCode(Integer.parseInt(code));
			vo.setUserCode(user.getUserCode());

			Favorite favorite = favService.select(vo);

			model.addAttribute("favorite", favorite);
		}

		List<Comment> com = comService.viewCom(Integer.parseInt(code));
		model.addAttribute("com", com);
		

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

	@PostMapping("/writeCom")
	public String insertCom(Comment vo, ModelAndView mav) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (!principal.equals("anonymousUser")) {
			User user = (User) principal;
			vo.setUserCode(user.getUserCode());
			comService.insertCom(vo);
			return "redirect:/detail?code=" + vo.getFesCode();
		} else {
			return "redirect:/detail?code=" + vo.getFesCode();
		}	
	}
	
	@ResponseBody
	@PostMapping("/delCom")
	public void deleteCom(int comCode) {
		comService.deleteCom(comCode);
	}
	
	

}
