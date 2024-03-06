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
		System.out.println("service : " + user);
		//System.out.println( "로그인 userService : " + username);
		return user;
	}
	
	// 회원가입
	public int registerUser (User vo) {
		String encodePw = bcpe.encode(vo.getPassword());
		vo.setPassword(encodePw);
		return dao.registerUser(vo);
	}
	
	// 아이디,이메일 변경
	public int updateUserNickname(User vo) {
		return dao.updateUserNickname(vo);
	}
	
	// 비번 변경
	public int updateUserInfo(User vo) {
		String encodePw = bcpe.encode(vo.getPassword());
		vo.setPassword(encodePw);
		return dao.updateUserInfo(vo);
	}
	
	// 유저 회원탈퇴
	public int unableAccount(User vo) {
		return dao.unableAccount(vo);
	}
}
