package com.semi.festopia.service.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority->{
			String auth= authority.getAuthority();
			roleNames.add(auth);
		});
		
		if(roleNames.contains("ROLE_ADMIN")) { //관리자가 로그인에 성공함
			response.sendRedirect("/");
		} else if(roleNames.contains("ROLE_MEMBER")) {// 유저가 로그인에 성공함
			response.sendRedirect("/");
			return;
		}
		// 메모 : 일단 권한직급이 뭐가 되든 간에 로그인되면 홈페이지로 강제 이송
		// user 정보가 잘 들어왔는지 확인할 수 있는 system.out은  UserService/ dao쪽의 login 로직에 있음.
		
		
	}
	
}
