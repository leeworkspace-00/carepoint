package com.aws.team.service;

import java.util.ArrayList;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface FreeBoardService {

	public int freeBoardTatalCount(SearchCriteria scri);

	public ArrayList<BoardVo> freeBoardSelectAll(SearchCriteria scri);

	public int freeBoardInsert(BoardVo bv);

	public BoardVo freeBoardSelectOne(int board_pk);

	public int freeBoardUpdate(BoardVo bv);

	public int freeBoardUpdateViewcnt(int board_pk);

	public int freeBoardUpdateRecom(int board_pk);

	public int freeBoardDelete(int board_pk);

}
