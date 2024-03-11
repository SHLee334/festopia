package com.semi.festopia.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Favorite {
	private int fvCode;
	private Date fvDate;
	private Festival festival;
}
