package com.aws.team.service;

import java.util.ArrayList;
import java.util.List;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.CommentVo;
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

	// 댓글기능
	public int commentInsert(CommentVo cv);

	public int commentTotalCnt(int board_pk);

	public ArrayList<CommentVo> commentSelectAll(int board_pk, int block);

	public int commentDelete(CommentVo cv);
	// 경현 : 마이페이지 자유게시판 목록 나타내기
	public List<BoardVo> mypageFreeList(int user_pk);

}
