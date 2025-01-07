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

}
