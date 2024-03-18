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
	
	// 조회수
	public int viewCount(int count) {
		return dao.viewCount(count);
	}
	
	//글 수정
	public int updateView(NoticeBoard board) {
		return dao.updateView(board);
	}
	
	// 글 삭제
	public int deleteView(int no) {
		return dao.deleteView(no);
	}
}
