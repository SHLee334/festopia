package com.semi.festopia.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class NoticeBoard {

	private int no;
	private int userCode;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String noticeUrl;
	private int viewCount;
	
	private User user;
	
	private MultipartFile file;
}

