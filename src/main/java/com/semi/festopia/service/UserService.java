package com.semi.festopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.UserDAO;
import com.semi.festopia.model.vo.User;


@Service
public class UserService implements UserDetailsService{
	
	@Autowired
	private BCryptPasswordEncoder bcpe;

	@Autowired
	private UserDAO dao;

	
	// 로그인
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = dao.loginUser(username);
		System.out.println(user);
		return user;
	}
	
	// 회원가입
	public int registerUser (User vo) {
		String encodePw = bcpe.encode(vo.getPassword());
		vo.setPassword(encodePw);
		return dao.registerUser(vo);
	}
}
