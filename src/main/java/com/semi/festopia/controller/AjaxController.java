package com.semi.festopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.UserService;

@Controller
public class AjaxController {

	@Autowired
	private UserService service;
	
	// AjaxController
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
}
