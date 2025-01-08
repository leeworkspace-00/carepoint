package com.aws.team.persistance;

import java.util.ArrayList;
import java.util.HashMap;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface FreeBoardMapper {

	public int freeBoardTatalCount(SearchCriteria scri);

	public ArrayList<BoardVo> freeBoardSelectAll(HashMap<String, Object> hm);
	
	public int freeBoardInsert(BoardVo bv);
	
	public BoardVo freeBoardSelectOne(int board_pk);
	
	public int freeBoardUpdate(BoardVo bv);
	
	public int freeBoardUpdateViewcnt(int board_pk);
	
	public int freeBoardUpdateRecom(BoardVo bv);
	
	public int freeBoardDelete(int board_pk);
}
