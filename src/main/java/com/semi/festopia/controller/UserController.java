package com.semi.festopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/";
	}
	
	// 회원가입
	@PostMapping("signUp")
	public String signUp(User vo) {
		service.registerUser(vo);
		return "redirect:/";
	}
	
	// 로그인
	//@PostMapping("signIn")
	//public String signIn(String username) {
		
		//service.loadUserByUsername(username);
		//System.out.println("UserController 로그인 : " + username);
		//return "redirect:/";
	//}
}
