package com.aws.team.persistance;


import com.aws.team.domain.UserVo;

public interface UserMapper {
	public int userInsert(UserVo uv);
	
	// 아이디 중복체크
	public int userIdCheck(String userid);
	
	// 닉네임 중복체크
	public int userNickCheck(String usernick);
	
	// 회원 로그인 시 확인하는 메서드
	public UserVo userLoginCheck(String userid);
}
