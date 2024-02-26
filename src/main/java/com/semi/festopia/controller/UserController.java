package com.semi.festopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	// 회원가입
	@PostMapping("signUp")
	public String signUp(User vo) {
		service.registerUser(vo);
		return "redirect:/";
	}
	
	// 로그인
	@PostMapping("signIn")
	public String signIn(String id) {
		service.loadUserByUsername(id);
		System.out.println(id);
		return "redirect:/";
	}
}
