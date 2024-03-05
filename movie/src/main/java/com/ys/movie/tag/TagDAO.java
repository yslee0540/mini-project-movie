package com.ys.movie.tag;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TagDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int writeTag(TagVO vo) {
		return my.insert("tag.write", vo);
	}
	
	public TagVO check(String tag_name) {
		return my.selectOne("tag.check", tag_name);
	}
	
	public List<TagVO> list(int board_no) {
		return my.selectList("tag.list", board_no);
	}
	
	public int map(BoardTagMapVO vo) {
		return my.insert("board_tag_map.write", vo);
	}
	
}
