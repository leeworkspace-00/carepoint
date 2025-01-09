package com.aws.team.service;

import java.util.ArrayList;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface NoticeBoardService {
	
	public ArrayList<BoardVo> noticeBoardSelectAll(SearchCriteria scri);
	public int noticeBoardTotalCount(SearchCriteria scri);
	public int noticeBoardInsert(BoardVo bv); // 게시물 작성
	public BoardVo noticeBoardSelectOne(int board_pk); // 게시물 보여주기
	public int noticeBoardDelete(int board_pk); // 삭제하기 기능
	public int noticeBoardUpdate(BoardVo bv); // 수정

}
