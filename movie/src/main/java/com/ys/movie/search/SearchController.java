package com.ys.movie.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ys.movie.board.BoardVO;
import com.ys.movie.tag.TagDAO;
import com.ys.movie.tag.TagVO;

@Controller
public class SearchController {
	@Autowired
	SearchDAO dao;
	
	@Autowired
	TagDAO dao2;

	final int PAGE_ROW_COUNT = 10;

	private void calculateTotalPage(SearchVO vo, Model model) {
		int count = dao.boardCount(vo);
		int totalPageCount = (int) Math.ceil(count / (double) PAGE_ROW_COUNT);
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("postCount", count);
	}

	@RequestMapping("search/tag")
	public void list(SearchVO vo, Model model) {
		calculateTotalPage(vo, model);
		model.addAttribute("tagName", dao.tagName(vo.getTag_no()));
	}
	
	@RequestMapping("search/keyword")
	public void list2(SearchVO vo, Model model) {
		calculateTotalPage(vo, model);
	}

	@RequestMapping("search/ajax_page")
	public void ajax_page(SearchVO vo, Model model) {
		vo.setStartEnd(vo.getPage(), PAGE_ROW_COUNT);
		calculateTotalPage(vo, model);
		
		List<BoardVO> list = dao.boardList(vo);
		for (int i = 0; i < list.size(); i++) {
			BoardVO boardVO = list.get(i);
			List<TagVO> tagList = dao2.list(boardVO.getBoard_no());
			boardVO.setTagList(tagList);
		}
		model.addAttribute("list", list);
	}

}
