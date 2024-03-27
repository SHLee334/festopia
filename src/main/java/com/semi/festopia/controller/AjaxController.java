package com.semi.festopia.controller;


import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.UserService;

@Controller
public class AjaxController {

	@Autowired
	private UserService service;
	
	// AjaxController
	
	// 회원가입시 아이디 실시간 중복체크
	@ResponseBody
	@PostMapping("/isDuplicated")
	public User idCheck(String id) {
		User user = service.idCheck(id);
		return user;
	}
	
	// 로그인시 패스워드 마이페이지로 바인딩
	@ResponseBody
	@PostMapping("/bindPwd")
	public String pwdBind(@RequestParam("pwd") String pwd, HttpSession session) {
		session.setAttribute("pwdBind", pwd);
		return "/mypage-account";
	}
	
	
	// user정보 update로직들 userController -> ajaxController로 변경
	@ResponseBody
	@PostMapping("/updateUserNickname")
	public User updateUserNickname(User user) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		User userDetails = (User) authentication.getPrincipal(); // 사용자 정보
			
		if(service.updateUserNickname(user)==1) {

			
			SecurityContextHolder.getContext().setAuthentication(createNewAuthentication(authentication, userDetails.getUsername()));
			// 다시 새롭게 변경된것 정보를 토대로 다시 시큐리티 사용자정보에 해당 정보를 대입시킴.
			return user;
		}else {
			return null;
		}
		
	}
	
	// 비밀번호 변경하기 userController -> ajaxController
	@ResponseBody
	@PostMapping("/updateUserInfo")
	public User updateUserInfo(User user) {
		if(service.updateUserInfo(user)==1) {
			return user;
		}else {
			return null;
		}
		// 비번 업데이트시 입력값이 다시 업데이트 되는 부분은 userService updateUserInfo 참조
		
	}
	
	
	private Authentication createNewAuthentication(Authentication currentAuth, String username) {
		UserDetails newPrincipal = service.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
		newAuth.setDetails(currentAuth.getDetails()); // 이 과정이 수정 버튼을 누르면 강제로 재 로그인 함으로써 모든 정보가 수정됨
		return newAuth;
	}

}
