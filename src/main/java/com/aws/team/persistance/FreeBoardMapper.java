package com.aws.team.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface FreeBoardMapper {

	public int freeBoardTatalCount(SearchCriteria scri);

	public ArrayList<BoardVo> freeBoardSelectAll(HashMap<String, Object> hm);

}
