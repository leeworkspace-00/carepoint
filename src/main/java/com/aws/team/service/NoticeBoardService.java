package com.aws.team.service;

import java.util.ArrayList;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface NoticeBoardService {
	
	public ArrayList<BoardVo> noticeBoardSelectAll(SearchCriteria scri);
	public int noticeBoardTotalCount(SearchCriteria scri);

}
