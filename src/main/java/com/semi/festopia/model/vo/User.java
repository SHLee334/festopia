package com.semi.festopia.model.vo;


import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class User implements UserDetails{
	private int userCode;
	private String id;
	private String password;
	private String nickname;
	private String email;
	private int enabled;
	private Date userEnrollDate; //java.sql.Date로 import 함.
	private Date userQuitDate;
	private String auth;
	private String userProfileUrl;
	private MultipartFile file;
	
	
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<>();
		authList.add(new SimpleGrantedAuthority(auth));
		return authList;
	}
	@Override
	public String getUsername() {
		
		return id;
	}
	@Override
	public boolean isAccountNonExpired() {
	
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}
	@Override
	public boolean isEnabled() {
		
		return enabled == 1 ? true : false;
	}
	

}
