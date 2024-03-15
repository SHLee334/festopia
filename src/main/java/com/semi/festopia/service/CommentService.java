package com.semi.festopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.CommentDAO;
import com.semi.festopia.model.vo.Comment;

@Service
public class CommentService {
	@Autowired
	private CommentDAO dao;
	
	public int insertCom(Comment com) {
		return dao.insertCom(com);
	}
	
	public List<Comment> viewCom(int fesCode) {
		return dao.viewCom(fesCode);
	}


}
