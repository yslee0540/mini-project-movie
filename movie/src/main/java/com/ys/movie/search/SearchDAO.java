package com.ys.movie.search;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ys.movie.board.BoardVO;

@Component
public class SearchDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public List<BoardVO> boardList(SearchVO vo) {
		return my.selectList("search.board-list", vo);
	}
	
	public int boardCount(SearchVO vo) {
		return my.selectOne("search.board-count", vo);
	}
	
	public String tagName(int no) {
		return my.selectOne("search.tag-name", no);
	}
}
