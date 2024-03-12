package com.semi.festopia.controller;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.UserService;

@Controller
public class AjaxController {

	@Autowired
	private UserService service;
	
	// AjaxController
	
	// 아이디 중복 체크
	@ResponseBody
	@PostMapping("/idCheck")
	public boolean idCheck(String id) {
		User user = service.idCheck(id);
		if (user != null) {
			return false;
		} else {
			return true;
		}
	}
	
	// 로그인시 패스워드 마이페이지로 바인딩
	@ResponseBody
	@PostMapping("/bindPwd")
	public String pwdBind(@RequestParam("pwd") String pwd, HttpSession session) {
		System.out.println("사용자한테 입력받은 로그인시 비밀번호 : " + pwd);
		
		session.setAttribute("pwdBind", pwd);
		return "/mypage-account";
	}

}
