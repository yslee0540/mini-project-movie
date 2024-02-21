package com.ys.movie.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(MemberVO vo) {
		int result = my.insert("musical.create", vo);
		return result;
	}
	
	public int delete(int no) {
		int result = my.delete("musical.delete", no);
		return result;
	}
	
	public int deleteAll() {
		int result = my.delete("musical.deleteAll");
		return result;
	}
	
	public int update(MemberVO vo) {
		int result = my.delete("musical.update", vo);
		return result;
	}
	
	public MemberVO one(int no) {
		MemberVO vo = my.selectOne("musical.one", no);
		return vo;
	}
	
	public List<MemberVO> list() {
		List<MemberVO> list = my.selectList("musical.list");
		return list;
	}
	
}
