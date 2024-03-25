package com.semi.festopia.controller;


import com.semi.festopia.model.vo.Favorite;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.NoticeBoardService;
import com.semi.festopia.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;


@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@Autowired
	private NoticeBoardService noticeService;

	@Autowired
	private FavoriteService favService;
	
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
	
	
	@GetMapping("/mypage")
	public void myPage(User user, Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		User userDetails = (User) authentication.getPrincipal(); // 사용자 정보

		model.addAttribute("board", noticeService.boardList());
		

		// 찜 목록
		List<Favorite> fvList = favService.selectFvAll(userDetails.getUserCode());
		model.addAttribute("fvList", fvList);
	}

	private String path = "D:\\festopia\\profile\\";
	
	private Authentication createNewAuthentication(Authentication currentAuth, String username) {
		UserDetails newPrincipal = service.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
		newAuth.setDetails(currentAuth.getDetails()); // 이 과정이 수정 버튼을 누르면 강제로 재 로그인 함으로써 모든 정보가 수정됨
		return newAuth;
	}
	
	//프로필사진 변경 로직
	@PostMapping("/changeProfile")
	public String changeProfile(User user) throws IllegalStateException, IOException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		User userDetails = (User) authentication.getPrincipal(); // 사용자 정보
	
		if(!user.getFile().isEmpty()) {
			if(user.getUserProfileUrl()!=null) {
				File file = new File(path + user.getUserProfileUrl());
				file.delete();
			}
			String url = fileUpload(user.getFile());
			user.setUserProfileUrl(url);
		}

		
		service.changeProfile(user);
		SecurityContextHolder.getContext().setAuthentication(createNewAuthentication(authentication, userDetails.getUsername()));
		
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
