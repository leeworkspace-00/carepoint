package com.aws.team.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aws.team.domain.UserDetailVo;
import com.aws.team.domain.UserVo;
import com.aws.team.persistance.UserDetailMapper;
import com.aws.team.persistance.UserMapper;


@Service
public class UserServiceImpl implements UserService {
	
	private UserMapper um;
	
	 @Autowired(required=false)
	   public UserServiceImpl(SqlSession sqlSession) {
		 //System.out.println("sqlSession:"+sqlSession);
	     this.um = sqlSession.getMapper(UserMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임
	                                                 // mybatis를 쓰기 위해 mapper와 연동
	   }

	@Override
	public int userInsert(UserVo uv) {
		int value = um.userInsert(uv);
		return value;
	}

	@Override	//아이디 중복체크 
	public int userIdCheck(String userid) {
		int value = um.userIdCheck(userid);
		return value;
	}
	
	@Override	//닉네임 중복체크 
	public int userNickCheck(String usernick) {
		int value = um.userNickCheck(usernick);
		return value;
	}

	@Override
	public UserVo userLoginCheck(String userid) {
		UserVo uv = um.userLoginCheck(userid);
		return uv;
	}






}
