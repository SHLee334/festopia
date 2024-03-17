package com.semi.festopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.festopia.model.dao.NoticeBoardDAO;
import com.semi.festopia.model.vo.NoticeBoard;
import com.semi.festopia.model.vo.User;

@Service
public class NoticeBoardService {

	@Autowired
	private NoticeBoardDAO dao;
	
	// 글 목록 가져오기
	public List<NoticeBoard> boardList() {
		return dao.boardList();
	}
	
	public int adminWrite(NoticeBoard board) {
		return dao.adminWrite(board);
	}
	
	// 게시글 상세페이지
	public NoticeBoard noticeView(int no) {
		return dao.noticeView(no);
	}
}
