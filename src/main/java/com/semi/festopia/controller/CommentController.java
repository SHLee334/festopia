package com.semi.festopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.festopia.model.vo.Comment;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService comService;
	
	@PostMapping("/writeCom")
	public String insertCom(Comment com, Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails user = (UserDetails) principal;

		
		comService.insertCom(com);
		return "redirect:/views/festivalDetail.jsp";
	}
	


}
