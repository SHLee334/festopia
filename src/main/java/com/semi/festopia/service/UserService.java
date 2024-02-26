package com.semi.festopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.UserDAO;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;
}
