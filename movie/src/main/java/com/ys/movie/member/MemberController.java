package com.ys.movie.member;

import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;

	@RequestMapping("castList")
	public void castList(Model model) {
		List<MemberVO> list = dao.list();
		model.addAttribute("list", list);
	}

	@RequestMapping("member/checkId")
	@ResponseBody
	public String checkId(String id) {
		int count = dao.checkId(id);
		
		if (count == 0) {
			if (!Pattern.matches("^[a-z0-9]{4,12}$", id)) {
				return "notMatchPattern";
			}
			return "idNotFound";
		}
		return "idDuplicated";
	}

	@RequestMapping("member/signup")
	public void signup(MemberVO vo) {
		dao.signup(vo);
	}
	
	@RequestMapping("member/login")
	@ResponseBody
	public String login(MemberVO vo, HttpSession session, Model model) {
		String name = dao.login(vo);
		if (name != null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", name);
			return "success";
		}
		return "error";
	}
	
	@RequestMapping("member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}

	@RequestMapping("delete")
	public String delete(int no) {
		System.out.println(no);
		dao.delete(no);
		return "redirect:castList";
	}


	@RequestMapping("update")
	public String update(MemberVO vo) {
		dao.update(vo);
		return "redirect:castList";
	}

}
