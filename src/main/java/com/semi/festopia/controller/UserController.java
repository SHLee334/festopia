package com.semi.festopia.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.UserService;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

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
	
	// 로그인성공시 유저 로그인정보 토큰 발행
	@PostMapping("/login")
	public String login(String id, String pwd, Model model) {

		// 로그인 처리를 했다 가정하에

		// 자동 로그인, 개인정보 수정 - 기존 비밀번호정보
		// JWT(Json Web Token) 토큰을 만들어서 해당 정보를 localStorage에 담아서 사용
		String token = jwtToken(id, pwd);
		System.out.println(token);
		model.addAttribute("token", token);

		// 로그인 되었다 가정 하에 토큰 받아서 해당정보들 다시 가져와보기
		Claims claims = decodeJwt(token);
		System.out.println(id);
		String password = claims.get("pwd", String.class);
		System.out.println(password);
		return "mypage";
	}

	private String jwtToken(String id, String pwd) {
		Date now = new Date();
		Date expireDate = new Date(now.getTime() + 3600000); // 유효시간 한시간
		return Jwts.builder().setSubject(id).claim("pwd", pwd) // setSubject이후 뭔가를 추가하고 싶다면 claim
				.setIssuedAt(now) // 토큰이 발급된 시간
				.setExpiration(expireDate) // 토큰만료시간
				.signWith(SignatureAlgorithm.HS512, "youarenowpigeon").compact();
	}

	private Claims decodeJwt(String token) {
		Jws<Claims> claims = Jwts.parser().setSigningKey("youarenowpigeon").parseClaimsJws(token);

		System.out.println("getbody" + claims.getBody());
		return claims.getBody();
	}
	
	
	
	
	
//	@PostMapping("/login")
//	public String login(String pwd, Model model) {
//		String token = jwtToken(pwd);
//		model.addAttribute("token", token);
//		
//		Claims claims = decodeJwt(token);
//		String password = claims.get("password",String.class);
//		System.out.println(password);
//		return "/";
//	}
//	
//	
//	private String jwtToken(String pwd) {
//		Date now = new Date();
//		Date expireDate = new Date(now.getTime() + 360000);
//		return Jwts.builder()
//				.setSubject(pwd)
//				.setIssuedAt(now)
//				.setExpiration(expireDate)
//				.signWith(SignatureAlgorithm.HS512, "goodPigeon")
//				.compact();
//	}
//	private Claims decodeJwt(String token) {
//		Jws<Claims> claims = Jwts.parser().setSigningKey("goodPigeon").parseClaimsJws(token);
//		return claims.getBody();
//		}
	
	
	
	
	
	
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
