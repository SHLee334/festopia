package com.semi.festopia.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class User {
	private int userCode;
	private String id;
	private String password;
	private String email;
	private Character userStatus;
	private Date userEnrollDate; //java.sql.Date로 import 함.
	private Date userQuitDate;
	private String userRole;
}
