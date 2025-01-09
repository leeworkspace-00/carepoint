package com.aws.team.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;
import com.aws.team.persistance.QnaBoardMapper;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	
	private QnaBoardMapper qm;

	@Autowired
	public QnaBoardServiceImpl(SqlSession sqlSession) {
	  	this.qm = sqlSession.getMapper(QnaBoardMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임
	  												   		   // mybatis를 쓰기 위해 mapper와 연동
	}
	
	// List
	@Override
	public ArrayList<BoardVo> qnaSelectAll(SearchCriteria scri) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());
		hm.put("searchType", scri.getSearchType());
		hm.put("perPageNum", scri.getPerPageNum());		
		
		ArrayList<BoardVo> blist = qm.qnaSelectAll(hm);
		
		return blist;
	}

	// List
	@Override
	public int qnaTotalCount(SearchCriteria scri) {
		
		int cnt = qm.qnaTotalCount(scri);
		return cnt;
	}
	
	// Content
	@Override
	public BoardVo qnaSelectOne(int board_pk) {
		
		BoardVo bv = qm.qnaSelectOne(board_pk);
		return bv;
	}
	
	// Content
	public List<Integer> getUserOriginNums(int user_pk) {
		
	    return qm.getUserOriginNums(user_pk);
	}
	
	// Write
	@Override
	@Transactional
	public int qnaInsert(BoardVo bv) {
	
		int value = qm.qnaInsert(bv);
		int max_board_pk = bv.getBoard_pk();
		int value2 = qm.origin_numUpdate(max_board_pk);
		
		return value+value2;
	}
	
	// Delete
	@Override
	public int qnaDelete(BoardVo bv) {
		
		int value = qm.qnaDelete(bv);
		
		return value;
	}
	
	// Modify
	@Override
	public int qnaUpdate(BoardVo bv) {

		int value = qm.qnaUpdate(bv);
		
		return value;
	}
	
	// Reply
	@Transactional // update, insert 둘 중 하나라도 실행 실패하면 원복
	@Override
	public int qnaReply(BoardVo bv) {

		int value = qm.qnaReplyInsert(bv);
		
		return value;
	}

	// Reply
	@Override
	public int hasReply(int origin_num) {
		
		// 답변의 개수를 세는 용도
		int value = qm.countReplies(origin_num);
		
		return value;
	}
	
	
	
	
	
	
	
}
