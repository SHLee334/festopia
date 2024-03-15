package com.semi.festopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.festopia.model.vo.Comment;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService comService;
	
	@PostMapping("/writeCom")
	public String insertCom(Comment vo) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User) principal;
		
		vo.setUserCode(user.getUserCode());
		comService.insertCom(vo);
		
		return "redirect:/detail?code=" + vo.getFesCode();
	}
	
	@PostMapping("/viewCom")
	public List<Comment> viewCom(int fesCode, Model model) {
		List<Comment> com = comService.viewCom(fesCode);
		model.addAttribute("com", com);
		return com;
	}
	
	


}
