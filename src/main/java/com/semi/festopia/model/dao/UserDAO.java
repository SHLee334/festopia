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
		return session.selectOne("userMapper.loginUser", id);
	}
}
