package com.semi.festopia.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.festopia.model.vo.NoticeBoard;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.NoticeBoardService;

@Controller
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService service;
	
	@GetMapping("admin")
	public void boardList(Model model) {
		model.addAttribute("board", service.boardList());
	}
	
	@GetMapping("/admin-write")
	public void adminWrite() {}
	

	private String path = "D:\\festopia\\adminUpload\\";
	
	// 파일 업로드 기능
	public String fileUpload(MultipartFile file) throws IllegalStateException, IOException {

		// 중복방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		File copyFile = new File(path + filename);
		file.transferTo(copyFile); // 업로드한 지정한 path위치로 저장
		return filename;
	}

	@PostMapping("/noticeWrite")
	public String adminWrite(NoticeBoard board) throws IllegalStateException, IOException {
		if(!board.getFile().isEmpty()) {
			String url = fileUpload(board.getFile());
			board.setNoticeUrl(url);
		}
		service.adminWrite(board);
		return "redirect:/admin";
	}
	// 특정 게시물 상세정보
	@GetMapping("/noticeView")
	public void noticeView(Model model, String no) {
		model.addAttribute("vo", service.noticeView(Integer.parseInt(no)));
	}
	
//	// 조회수
//	@ResponseBody
//	@PostMapping("/viewCount")
//	public int viewCount(String count) {
//		System.out.println("controller" + Integer.parseInt(count));
//	return service.viewCount(Integer.parseInt(count));
//	}
	
	// 글 수정
	@PostMapping("/updateNotice")
	public String updateView(NoticeBoard b) throws IllegalStateException, IOException {
		if(!b.getFile().isEmpty()) {
			if(b.getNoticeUrl()!=null) {
				File file = new File(path + b.getNoticeUrl());
				file.delete();
			}
			String url = fileUpload(b.getFile());
			b.setNoticeUrl(url);
		}
		service.updateView(b);
		
		return "redirect:/noticeView?no="+b.getNo();
	}
	
	// 글 삭제
	@GetMapping("/delete")
	public String deletView(String no) {
		int parsingNo = Integer.parseInt(no);
		
		NoticeBoard b = service.noticeView(parsingNo);
		if(b.getNoticeUrl()!=null) {
			File file = new File(path + b.getNoticeUrl());
			file.delete();
		}
		service.deleteView(parsingNo);
		return "redirect:/mypage";
	}
	
}
