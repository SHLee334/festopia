package com.semi.festopia.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Festival {
	private int fesCode;
	private String name;
	private String startDate;
	private String endDate;
	private String status;
	private String place;
	private String lat;
	private String lot;
	private String feeStatus;
	private String fee;
	private String age;
	private String enrollDate;
	private String operator;
	private String hmpgUrl;
	private String poster;
	private int viewCount;
	private String season;
	private String category;
	

}
