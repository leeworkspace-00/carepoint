package com.aws.team.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aws.team.domain.ExerciseVo;
import com.aws.team.persistance.ExerciseMapper;

@Service
public class ExerciseServiceImpl implements ExerciseService{
	
	private ExerciseMapper em;

	@Autowired 
	public ExerciseServiceImpl(SqlSession sqlSession) {
	  	this.em = sqlSession.getMapper(ExerciseMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임
	  												   		   // mybatis를 쓰기 위해 mapper와 연동
	}

	@Transactional
	@Override
	public void saveExercise(ExerciseVo ev) {
		
		em.insertExercise(ev);
	}

    

}
