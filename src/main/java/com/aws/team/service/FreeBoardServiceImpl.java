package com.aws.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;
import com.aws.team.persistance.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	private FreeBoardMapper fbm;
	
	@Autowired
	public FreeBoardServiceImpl(SqlSession sqlSession) {
		this.fbm = sqlSession.getMapper(FreeBoardMapper.class);      
	}
	
	@Override
	public int freeBoardTatalCount(SearchCriteria scri) {
		
		int cnt = fbm.freeBoardTatalCount(scri);
		
		return cnt;
	}

	@Override
	public ArrayList<BoardVo> freeBoardSelectAll(SearchCriteria scri) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>(); // 알아보기
		hm.put("startPageNum", (scri.getPage()-1) * scri.getPerPageNum());
		hm.put("perPageNum", scri.getPerPageNum());
		hm.put("keyword", scri.getKeyword());
		
		ArrayList<BoardVo> blist = fbm.freeBoardSelectAll(hm);
		
		return blist;
	}

	@Override
	public int freeBoardInsert(BoardVo bv) {
		
		int value = fbm.freeBoardInsert(bv);
		
		return value;
	}

	@Override
	public BoardVo freeBoardSelectOne(int board_pk) {
	
		BoardVo bv = fbm.freeBoardSelectOne(board_pk);
		
		return bv;
	}

	@Override
	public int freeBoardUpdate(BoardVo bv) {

		int value = fbm.freeBoardUpdate(bv);
		
		return value;
	}

	@Override
	public int freeBoardUpdateViewcnt(int board_pk) {

		int value = fbm.freeBoardUpdateViewcnt(board_pk);
		
		return value;
	}

	@Override
	public int freeBoardUpdateRecom(int board_pk) {
		
		BoardVo bv = new BoardVo();
		
		bv.setBoard_pk(board_pk);
		fbm.freeBoardUpdateRecom(bv);
		
		int recom = bv.getRecom();
		
		return recom;
	}

}
