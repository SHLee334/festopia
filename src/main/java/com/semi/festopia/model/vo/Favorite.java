package com.semi.festopia.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data @NoArgsConstructor
public class Favorite {
	
	private int fvCode;
	private Date fvDate;
	private int userCode;
	private int fesCode;
	
}
