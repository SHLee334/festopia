package com.semi.festopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String pwdBind(String[] pwd, Model model) {
		System.out.println( pwd);
		
		model.addAttribute("pwdBind", pwd);
		return "/mypage-favorite";
	}

}
