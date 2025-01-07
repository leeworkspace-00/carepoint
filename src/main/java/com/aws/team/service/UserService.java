package com.aws.team.service;


import org.springframework.stereotype.Service;

import com.aws.team.domain.UserDetailVo;
import com.aws.team.domain.UserVo;

@Service
public interface UserService  {
	// 회원가입기능 메서드
	public int userInsert(UserVo uv);
	
	// 아이디 중복체크기능 메서드
	public int userIdCheck(String userid);

	// 닉네임 중복체크기능 메서드
	public int userNickCheck(String usernick);
	
	// 회원로그인시 확인하는 메서드
	public UserVo userLoginCheck(String userid);
	
	
	
}
