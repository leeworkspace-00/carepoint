package com.aws.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aws.team.domain.BoardVo;
import com.aws.team.domain.SearchCriteria;
import com.aws.team.persistance.FoodMapper;
import com.aws.team.persistance.NoticeBoardMapper;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	
	private NoticeBoardMapper nbm;
	
	@Autowired(required=false) /* 주입시킨다 */  
	public NoticeBoardServiceImpl(SqlSession sqlSession) {
		this.nbm = sqlSession.getMapper(NoticeBoardMapper.class); /* 꼭 뒤에 클래스가 붙어야한다. */ 
	}
	
	
	// 게시글 목록을 검색 조건에 따라 조회하는 메서드
	@Override
	public ArrayList<BoardVo> noticeBoardSelectAll(SearchCriteria scri) {
		
		// HashMap 객체를 생성하여 페이징, 검색 타입, 키워드 등의 조건을 추가
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("startPageNum",(scri.getPage()-1)* scri.getPerPageNum()); // 시작 페이지 번호
		hm.put("searchType", scri.getSearchType());  // 검색 유형
		hm.put("keyword", scri.getKeyword()); // 검색 키워드
		hm.put("perPageNum", scri.getPerPageNum()); // 페이지당 게시글 수
		
		// NoticeBoardMapper를 사용해서 검색 조건에 맞는 게시글 목록 조회
		ArrayList<BoardVo> blist = nbm.noticeBoardSelectAll(hm);
		return blist;
	}

	
	// 총 게시글 수를 검색 조건에 따라 가져오는 메서드
	@Override
	public int noticeBoardTotalCount(SearchCriteria scri) {
		// 검색 조건을 통해 BoardMapper에서 총 게시글 수를 조회		
		int cnt = nbm.noticeBoardTotalCount(scri);
		return cnt;
	}

}
