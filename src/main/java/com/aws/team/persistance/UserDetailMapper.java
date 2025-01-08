package com.aws.team.persistance;

import com.aws.team.domain.UserDetailVo;

public interface UserDetailMapper {
	// 상세정보 삽입 메서드
	public int userDetailInsert(UserDetailVo u_dv);

}
