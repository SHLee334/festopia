package com.semi.festopia.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.vo.Comment;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertCom(Comment com) {
		return session.insert("commentMapper.insertCom", com);
	}

}
