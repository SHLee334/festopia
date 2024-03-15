package com.semi.festopia.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@GetMapping("/")
	public String index() {
		return "redirect:/";
	}
	
	@GetMapping("loginFail")
	public String loginFail() {
		return "redirect:/";
	}
	
	@GetMapping("admin")
	public void admin() {}
	
	// 회원가입
	@PostMapping("signUp")
	public String signUp(User vo) {
		service.registerUser(vo);
		return "redirect:/";
	}
	
	
	@GetMapping("/mypage-favorite")
	public void favorite() {}
	
	@GetMapping("/mypage")
	public void myPage(User user) {}
	
	@PostMapping("/unableAccount")
	public String unableAccount(User vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(service.unableAccount(vo)==1) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	
}
