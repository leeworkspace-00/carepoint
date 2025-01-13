package com.aws.team.service;

import java.util.List;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.ExerciseVo;
import com.aws.team.domain.GraphVo;

public interface ExerciseService {
	
	// DB에 운동 시간 저장
	public void saveExercise(ExerciseVo ev);
	
	// DB에 저장되어있는 모든 운동 시간 데이터 꺼내오기
	public List<ExerciseVo> getAllExercises();
	
	// graph 작성
	public int graphInsert(GraphVo gv);

}
