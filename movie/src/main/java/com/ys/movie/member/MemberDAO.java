package com.ys.movie.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int signup(MemberVO vo) {
		return my.insert("member.signup", vo);
	}
	
	public int checkId(String id) {
		return my.selectOne("member.checkId", id);
	}
	
	public String login(MemberVO vo) {
		return my.selectOne("member.login", vo);
	}
	
	public int delete(int no) {
		int result = my.delete("member.delete", no);
		return result;
	}
	
	public int deleteAll() {
		int result = my.delete("member.deleteAll");
		return result;
	}
	
	public int update(MemberVO vo) {
		int result = my.delete("member.update", vo);
		return result;
	}
	public List<MemberVO> list() {
		List<MemberVO> list = my.selectList("member.list");
		return list;
	}
	
}
