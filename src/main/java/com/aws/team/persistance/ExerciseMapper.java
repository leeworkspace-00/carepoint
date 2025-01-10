package com.aws.team.persistance;

import java.util.List;

import com.aws.team.domain.ExerciseVo;

public interface ExerciseMapper {
	
	// DB에 운동 시간 저장
	public void insertExercise(ExerciseVo ev);
	
	// DB에 저장되어있는 모든 운동 시간 데이터 꺼내오기
	public List<ExerciseVo> selectAllExercises();

}
