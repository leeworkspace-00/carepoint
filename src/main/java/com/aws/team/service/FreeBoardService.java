package com.aws.team.service;

import java.util.ArrayList;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface FreeBoardService {

	public int freeBoardTatalCount(SearchCriteria scri);

	public ArrayList<BoardVo> freeBoardSelectAll(SearchCriteria scri);

	public int freeBoardInsert(BoardVo bv);

}
