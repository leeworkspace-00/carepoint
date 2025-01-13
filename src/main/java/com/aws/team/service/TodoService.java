package com.aws.team.service;

import java.util.ArrayList;

import com.aws.team.domain.TodoVo;

public interface TodoService {
	
	public ArrayList<TodoVo> todoSelectAll(int user_pk);

	public int todoInsert(TodoVo tv);

	public int todoCount(String selectdate);

}
