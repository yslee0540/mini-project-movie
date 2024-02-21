package com.ys.movie.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;

	@RequestMapping("dateList")
	public void list(Model model) {
		List<MemberVO> list = dao.list();
		model.addAttribute("list", list);
	}

	@RequestMapping("castList")
	public void castList(Model model) {
		List<MemberVO> list = dao.list();
		model.addAttribute("list", list);
	}

	@RequestMapping("one")
	public void one(int no, Model model) {
		MemberVO vo = dao.one(no);
		model.addAttribute("vo", vo);
	}

	@RequestMapping("insert")
	public void insert(Model model) {
		MemberVO vo = new MemberVO();
		String s1 = "1/2 화 19:30\r\n" + "조승우\r\n" + "송은혜\r\n" + "황건하\r\n" + "한보라\r\n" + "1/5 금 14:30\r\n" + "조승우\r\n"
				+ "손지수\r\n" + "송원근\r\n" + "이지영\r\n" + "1/7 일 15:00\r\n" + "조승우\r\n" + "손지수\r\n" + "송원근\r\n" + "이지영\r\n"
				+ "1/10 수 14:30\r\n" + "조승우\r\n" + "손지수\r\n" + "황건하\r\n" + "한보라\r\n" + "1/12 금 14:30\r\n" + "조승우\r\n"
				+ "송은혜\r\n" + "황건하\r\n" + "한보라\r\n" + "1/14 일 15:00\r\n" + "조승우\r\n" + "송은혜\r\n" + "황건하\r\n" + "한보라\r\n"
				+ "1/16 화\r\n" + "19:30\r\n" + "조승우\r\n" + "송은혜\r\n" + "황건하\r\n" + "이지영\r\n" + "1/19 금 14:30\r\n"
				+ "조승우\r\n" + "손지수\r\n" + "송원근\r\n" + "한보라\r\n" + "1/21 일\r\n" + "15:00\r\n" + "조승우\r\n" + "손지수\r\n"
				+ "송원근\r\n" + "한보라\r\n" + "1/24 수\r\n" + "14:30\r\n" + "조승우\r\n" + "손지수\r\n" + "송원근\r\n" + "한보라\r\n"
				+ "1/26 금 14:30\r\n" + "조승우\r\n" + "송은혜\r\n" + "송원근\r\n" + "한보라\r\n" + "1/28 일 15:00\r\n" + "조승우\r\n"
				+ "송은혜\r\n" + "송원근\r\n" + "이지영\r\n" + "1/30 화\r\n" + "19:30\r\n" + "조승우\r\n" + "송은혜\r\n" + "송원근\r\n"
				+ "한보라\r\n" + "2/2 금 14:30\r\n" + "조승우\r\n" + "손지수\r\n" + "황건하\r\n" + "한보라\r\n"
				+ "2/4 일 15:00 조승우 손지수 송원근 이지영\r\n" + "";
		String[] s2 = s1.split("\r\n|\\s|/");

		int no = 1;
		for (int i = 0; i < s2.length; i = i + 8) {
			int date = Integer.parseInt(s2[i + 1]);
			if (s2[i + 4].equals("조승우")) {
				vo.setNo(no);
				vo.setDate(date);
				vo.setDay(s2[i + 2]);
				vo.setTime(s2[i + 3]);
				vo.setCsw("조승우");
				vo.setC1(s2[i + 5]);
				vo.setC2(s2[i + 6]);
				vo.setC3(s2[i + 7]);
				dao.insert(vo);
				no++;
			}
		}
		model.addAttribute("count", no - 1);
	}

	@RequestMapping("delete")
	public String delete(int no) {
		System.out.println(no);
		dao.delete(no);
		return "redirect:castList";
	}

	@RequestMapping("deleteAll")
	public void delete() {
		dao.deleteAll();
	}

	@RequestMapping("update")
	public String update(MemberVO vo) {
		dao.update(vo);
		return "redirect:castList";
	}

}
