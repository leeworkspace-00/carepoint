package com.aws.team.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;

public interface QnaBoardMapper {
	
	// 모든 QnA 추출
	public ArrayList<BoardVo> qnaSelectAll(HashMap<String,Object> hm);
		
	// QnA 총 개수 추출
	public int qnaTotalCount(SearchCriteria scri);
	
	// 특정 QnA 게시글 추출
	public BoardVo qnaSelectOne(int board_pk);
	
	// 로그인 한 회원이 쓴 글의 origin_num과 같은 origin_num을 가지고 있는 게시글 찾기	
	public List<Integer> getUserOriginNums(int user_pk);
	
	// QnA 게시글 생성
	public int qnaInsert(BoardVo bv);
	
	// 게시글 생성 후 0이 들어가있는 origin_num에 maxboard_pk값을 넣어주는 Update 메서드
	public int origin_numUpdate(int board_pk);
	
	// QnA 삭제
	public int qnaDelete(BoardVo bv);	
	
	// QnA 수정
	public int qnaUpdate(BoardVo bv);
	
	// 게시글 답변 생성
	public int qnaReplyInsert(BoardVo bv);
	
	// 원글에 달린 답변 갯수 세기
	public int countReplies(int origin_num);
	
	// 경현 : 마이페이지 문의글 목록
	public List<BoardVo> mypageQnaList(int user_pk);

}
