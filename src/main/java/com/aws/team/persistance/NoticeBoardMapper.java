package com.aws.team.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface NoticeBoardMapper {
	
	
	/* 마이바티스용 메소드. 서비스에 있는 메소드 이름을 동일하게 해서 헷갈리지 않게 한다. */ 
	public ArrayList<BoardVo> noticeBoardSelectAll(HashMap<String,Object> hm);
	public int noticeBoardTotalCount(SearchCriteria scri);

}
