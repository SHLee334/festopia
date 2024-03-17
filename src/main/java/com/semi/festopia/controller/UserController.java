package com.semi.festopia.controller;



import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	private String path = "C:\\Back_end_workspace\\spring-workspace\\festopia\\src\\main\\webapp\\resources\\profile\\";
	//private String path = "C:\\Back_end_workspace\\festTest\\";
	//프로필사진 변경 로직
	@PostMapping("/changeProfile")
	public String changeProfile(User user) throws IllegalStateException, IOException {
		if(!user.getFile().isEmpty()) {
			if(user.getUserProfileUrl()!=null) {
				File file = new File(path + user.getUserProfileUrl());
				file.delete();
			}
			String url = fileUpload(user.getFile());
			user.setUserProfileUrl(url);
		}
		service.changeProfile(user);
		
		return "redirect:/mypage";
	}
	
	// 파일 업로드 기능
	public String fileUpload(MultipartFile file) throws IllegalStateException, IOException {

		// 중복방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		File copyFile = new File(path + filename);
		file.transferTo(copyFile); // 업로드한 지정한 path위치로 저장
		return filename;
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
