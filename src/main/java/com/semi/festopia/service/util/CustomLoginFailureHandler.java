package com.semi.festopia.service.util;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomLoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("Login failed for user: " + request.getParameter("username"));
		if(exception instanceof AuthenticationServiceException) {
			request.setAttribute("loginFail", "존재하지않는 사용자입니다.");
			
		} else if(exception instanceof BadCredentialsException) {
			request.setAttribute("loginFail", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			
		} else if(exception instanceof DisabledException) {
			request.setAttribute("loginFail", "비활성화된 계정입니다.");
			// 위에 세가지가 현재 필수로 필요한 로직들
		} 
		
		// 관련된것을 다시 로그인jsp로 이동시키기
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login?error=true");
		dispatcher.forward(request, response);
	}

}
