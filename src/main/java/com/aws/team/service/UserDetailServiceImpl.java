package com.aws.team.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aws.team.domain.UserDetailVo;
import com.aws.team.persistance.UserDetailMapper;

@Service
public class UserDetailServiceImpl implements UserDetailService {
	
	private UserDetailMapper u_dm;
	
	 @Autowired(required=false)
	   public UserDetailServiceImpl(SqlSession sqlSession) {
		 //System.out.println("sqlSession:"+sqlSession);
	     this.u_dm = sqlSession.getMapper(UserDetailMapper.class); 
	   }

	@Override
	public int userDetailInsert(UserDetailVo u_dv) {
		int value = u_dm.userDetailInsert(u_dv);

		return value;
	}

	@Override
	public int updateDetail_pk(UserDetailVo u_dv) {
		int value = u_dm.updateDetail_pk(u_dv);
		return value;
	}

}
