package com.semi.festopia.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public int registerUser(User vo) {
		return session.insert("userMapper.registerUser", vo);
	}
	
	public User loginUser(String id) {
		User user = session.selectOne("userMapper.loginUser", id);
		System.out.println("user : " + user);
		return user;
	}
	
	
	// 유저 닉네임&이메일 변경
	public int updateUserNickname(User vo) {
		return session.update("userMapper.updateUserNickname", vo);
	}
	
	// 유저 비번 변경
	public int updateUserInfo(User vo){
		return session.update("userMapper.updateUserInfo", vo);
	}
	
	// 유저 회원탈퇴
	public int unableAccount(User vo) {
		return session.update("userMapper.unableAccount", vo);
	}
				
	// ajax, 유저 아이디 중복테크
	public User idCheck(String id) {
		return session.selectOne("userMapper.idCheck", id);
	}
	
	// 유저 프로필 변경
	public int changeProfile(User vo) {
		return session.update("userMapper.userProfile", vo);
	}
}
