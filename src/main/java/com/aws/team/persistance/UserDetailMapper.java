package com.aws.team.persistance;

import com.aws.team.domain.UserDetailVo;

public interface UserDetailMapper {
	// 상세정보 삽입 메서드
	public int userDetailInsert(UserDetailVo u_dv);
	
	// 삽입할 때 detailpk값 업데이트 메서드
	public int updateDetail_pk (UserDetailVo u_dv);
	
	public UserDetailVo userDetailSelectOne(int user_pk);

}
