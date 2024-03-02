package com.ys.movie.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int write(BoardVO vo) {
		return my.insert("board.write", vo);
	}
	
	public List<BoardVO> list(BoardVO vo) {
		return my.selectList("board.list", vo);
	}
	
	public int count(BoardVO vo) {
		return my.selectOne("board.count", vo);
	}
	
	public int delete(int no) {
		int result = my.delete("board.delete", no);
		return result;
	}
	
	public int deleteAll() {
		int result = my.delete("board.deleteAll");
		return result;
	}
	
	public int update(BoardVO vo) {
		int result = my.delete("board.update", vo);
		return result;
	}
	
}
