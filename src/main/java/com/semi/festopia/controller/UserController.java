package com.semi.festopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.festopia.service.UserService;

@Controller
public class UserController {

	private UserService service;
	
	@GetMapping("register")
	public String register() {
		System.out.println("register getmapping 정상작동 확인완료");
		return "register";
	}
	
	@PostMapping("signUp")
	public String signUp() {
		return "redirect:/";
	}
}
