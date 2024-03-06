package com.semi.festopia.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	// 로그인 후 마이페이지이동
//	@GetMapping("/mypage") 	@ResponseBody 
//    public String currentUserName(Authentication authentication) 
//    { 
//    	UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
//    	System.out.println(userDetails.getUsername());
//        return userDetails.getUsername(); 
//    } 
	@GetMapping("/mypage")
	public void myPage(User user) {
		
	}
	
	@PostMapping("/updateUserNickname")
	public String updateUserNickname(User vo,  HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(service.updateUserNickname(vo)==1) {
			session.setAttribute("vo", vo);
		}
		System.out.println(vo);
		return "/mypage";
	}
	
	@PostMapping("/updateUserInfo")
	public String updateUserInfo(User vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(service.updateUserInfo(vo)==1) {
			session.setAttribute("vo", vo);
		}
		// 고쳐야 되는 부분. 비번 업데이트시 인코딩이 되지 않을 날것의 상태에 db에 저장됨.
		return "/mypage";
	}
	
	@PostMapping("/unableAccount")
	public String unableAccount(User vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(service.unableAccount(vo)==1) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	
}
