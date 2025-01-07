package com.aws.team.service;

import org.springframework.stereotype.Service;

import com.aws.team.domain.UserDetailVo;

@Service
public interface UserDetailService {
	
	//상세정보 입력 메서드
	public int userDetailInsert(UserDetailVo u_dv);

}
