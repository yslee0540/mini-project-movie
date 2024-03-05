package com.ys.movie.tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TagController {
	@Autowired
	TagDAO dao;

	@RequestMapping("board/tagList")
	public void list(int board_no, Model model) {
		model.addAttribute("list", dao.list(board_no));
	}
}
