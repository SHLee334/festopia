package com.semi.festopia.model.dto;

import java.util.List;

import lombok.Data;

@Data
public class SearchDTO {
	private List<String> checkFesCate;
	private boolean noCategory;
	private List<String> checkFeeStatus;
	private boolean freeOrNo;
}
