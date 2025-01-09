package com.aws.team.service;

import java.util.ArrayList;
import java.util.List;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface QnaBoardService {
	
	// 모든 QnA 추출
	public ArrayList<BoardVo> qnaSelectAll(SearchCriteria scri);
		
	// QnA 총 개수 추출
	public int qnaTotalCount(SearchCriteria scri);
	
	// 특정 QnA 게시글 추출
	public BoardVo qnaSelectOne(int board_pk);
	
	// 로그인 한 회원이 쓴 글의 origin_num과 같은 origin_num을 가지고 있는 게시글 찾기
	public List<Integer> getUserOriginNums(int user_pk);
	
	// QnA 작성
	public int qnaInsert(BoardVo bv);
	
	// QnA 삭제
	public int qnaDelete(BoardVo bv);
	
	// QnA 수정
	public int qnaUpdate(BoardVo bv);
	
	// QnA 답변 작성
	public int qnaReply(BoardVo bv);
	
	// 답변 수 1개로 제한
	public int hasReply(int origin_num);

}
