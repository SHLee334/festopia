package com.semi.festopia.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.semi.festopia.model.vo.Favorite;

import com.semi.festopia.model.vo.NoticeBoard;
import com.semi.festopia.model.vo.User;
import com.semi.festopia.service.FavoriteService;
import com.semi.festopia.service.NoticeBoardService;


@Controller
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService service;
	
	@Autowired
	private FavoriteService favService;
	
	@GetMapping("board")
	public void boardList(Model model) {
		model.addAttribute("board", service.boardList());
		
		// board로 축제 찜목록 바운딩
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		User userDetails = (User) authentication.getPrincipal(); // 사용자 정보
		
		List<Favorite> fvList = favService.selectFvAll(userDetails.getUserCode());
		model.addAttribute("favInBoard", fvList);
	}
	
	@GetMapping("/admin-write")
	public void adminWrite() {}
	

	private String path = "D:\\festopia\\adminUpload\\";
//	private String path = "C:\\festopia\\adminUpload\\";
	
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
		return "redirect:/mypage";
	}
	// 특정 게시물 상세정보
	@GetMapping("/noticeView")
	public void noticeView(Model model, String no) {
		model.addAttribute("vo", service.noticeView(Integer.parseInt(no)));
		
		// board로 축제 찜목록 바운딩
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); // 인증정보
		User userDetails = (User) authentication.getPrincipal(); // 사용자 정보

		List<Favorite> fvList = favService.selectFvAll(userDetails.getUserCode());
		model.addAttribute("favInBoard", fvList);
	}
	
	// 조회수
	@ResponseBody
	@PostMapping("/viewCount")
	public int viewCount(String viewCount) {
		System.out.println("controller 제발" +Integer.parseInt(viewCount));
	return service.viewCount(Integer.parseInt(viewCount));
	}
	
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
