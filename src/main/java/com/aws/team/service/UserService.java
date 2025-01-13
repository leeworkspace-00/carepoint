package com.aws.team.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
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
	
	public UserVo userSelectOne(int user_pk);
	
	//비번 변경시 회원 확인하는 메서드
	public Integer userCheck(@Param("username")String username, @Param("userid")String userid, @Param("useremail")String useremail);
		
	// 랜덤 비밀번호 생성하는 메서드
	public String randomPwd();
	
	// 랜덤 비번으로 db 업데이트 하기
	public int updatePwd(String userid, String newEncryPwd);
	

	
}	
