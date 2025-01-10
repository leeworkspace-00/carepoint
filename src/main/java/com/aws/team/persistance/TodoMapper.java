package com.aws.team.persistance;

import java.util.ArrayList;

import com.aws.team.domain.TodoVo;

public interface TodoMapper {
	
	public ArrayList<TodoVo> todoSelectAll(int user_pk);
	
	public int todoInsert(TodoVo tv);
}
