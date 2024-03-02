package com.ys.movie.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@Autowired
	BoardDAO dao;

	final int PAGE_ROW_COUNT = 20;

	@RequestMapping("board/write")
	public String write(BoardVO vo) {
		dao.write(vo);
		return "redirect:list";
	}
	
	private void calculateTotalPage(BoardVO vo, Model model) {
		int count = dao.count(vo);
		int totalPageCount = (int)Math.ceil(count / (double)PAGE_ROW_COUNT);
		
		model.addAttribute("totalPageCount", totalPageCount);
	}
	
	@RequestMapping("board/list")
	public void list(BoardVO vo, Model model) {
		calculateTotalPage(vo, model);
	}
	
	@RequestMapping("board/ajax_page")
	public void ajax_page(BoardVO vo, Model model) {
		vo.setStartEnd(vo.getPage(), PAGE_ROW_COUNT);
		calculateTotalPage(vo, model);
		model.addAttribute("list", dao.list(vo));
	}

}
