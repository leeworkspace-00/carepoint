package com.aws.team.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.CommentVo;
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
	
	// 댓글기능
	public int commentInsert(CommentVo cv);
	
	public int commentTotalCnt(int board_pk);
	
	public ArrayList<CommentVo> commentSelectAll(HashMap<String, Object> hm);
	
	public int commentDelete(CommentVo cv);
	
	// 경현 : 마이페이지 문의글 목록
	public List<BoardVo> mypageFreeList(int user_pk);
}
