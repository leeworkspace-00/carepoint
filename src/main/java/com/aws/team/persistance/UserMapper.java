package com.aws.team.persistance;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aws.team.domain.UserVo;

public interface UserMapper {
	public int userInsert(UserVo uv);
	
	// 아이디 중복체크
	public int userIdCheck(String userid);
	
	// 닉네임 중복체크
	public int userNickCheck(String usernick);
	
	// 회원 로그인 시 확인하는 메서드
	public UserVo userLoginCheck(String userid);
	
	// 마이페이지에 회원정보 1개 가져오는 메서드
	public UserVo userSelectOne(int user_pk);
	
	//비번 변경시 회원 확인하는 메서드
	public Integer userCheck(@Param("username")String username, @Param("userid")String userid, @Param("useremail")String useremail);
	
	// 랜덤 비번으로 db에 업데이트
	public int updatePwd(String userid, String newEncryPwd);
}
