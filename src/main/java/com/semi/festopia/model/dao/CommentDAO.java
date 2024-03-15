package com.semi.festopia.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.festopia.model.vo.Comment;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate session;
	
	// 댓글 입력
	public int insertCom(Comment com) {
		return session.insert("commentMapper.insertCom", com);
	}
	
	// 댓글 출력
	public List<Comment> viewCom(int fesCode) {
		return session.selectList("commentMapper.viewCom", fesCode);
	}

}
