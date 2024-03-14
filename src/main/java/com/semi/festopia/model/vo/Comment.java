package com.semi.festopia.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Comment {
	private int comCode;
	private String comText;
	private String comDate;
	private String comDeleteStatus;
	private int userCode;
	private int fesCode;

}
