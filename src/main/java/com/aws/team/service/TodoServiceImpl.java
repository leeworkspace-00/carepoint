package com.aws.team.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aws.team.domain.TodoVo;
import com.aws.team.persistance.TodoMapper;

@Service
public class TodoServiceImpl implements TodoService {
	
	private TodoMapper tm;
	
	@Autowired
	public TodoServiceImpl(SqlSession sqlSession) {
		this.tm = sqlSession.getMapper(TodoMapper.class);      
	}

	@Override
	public int todoInsert(TodoVo tv) {
		
		int value = tm.todoInsert(tv);
		
		return value;
	}
	
	
}






	
	
	

