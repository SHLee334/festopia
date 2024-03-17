package com.semi.festopia.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.semi.festopia.model.vo.NoticeBoard;
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
	
	private String path = "C:\\Back_end_workspace\\spring-workspace\\festopia\\src\\main\\webapp\\resources\\adminUpload\\";
	//private String path = "C:\\Back_end_workspace\\festTest\\";
	
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
}
