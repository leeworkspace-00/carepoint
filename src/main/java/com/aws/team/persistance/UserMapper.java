package com.aws.team.persistance;

import com.aws.team.domain.UserVo;

public interface UserMapper {
	public int userInsert(UserVo uv);
	
	// 아이디 중복체크
	public int userIdCheck(String userid);
	
	// 닉네임 중복체크
	public int userNickCheck(String usernick);

}
