package com.ys.movie.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ys.movie.tag.BoardTagMapVO;
import com.ys.movie.tag.TagDAO;
import com.ys.movie.tag.TagVO;

@Controller
public class BoardController {
	@Autowired
	BoardDAO dao;

	@Autowired
	TagDAO dao2;

	final int PAGE_ROW_COUNT = 20;

	@RequestMapping("board/write")
	public String write(BoardVO vo) {
		dao.write(vo);

		for (String tag : vo.getTag()) {
			TagVO tagVO = checkTag(tag);
			BoardTagMapVO mapVO = new BoardTagMapVO();
			mapVO.setBoard_no(vo.getBoard_no());
			mapVO.setTag_no(tagVO.getTag_no());
			dao2.map(mapVO);
		}

		return "redirect:list";
	}

	private TagVO checkTag(String tag) {
		TagVO vo = dao2.check(tag);
		if (vo == null) {
			TagVO tagVO = new TagVO();
			tagVO.setTag_name(tag);
			dao2.writeTag(tagVO);
			return tagVO;
		}
		return vo;
	}

	private void calculateTotalPage(BoardVO vo, Model model) {
		int count = dao.count(vo);
		int totalPageCount = (int) Math.ceil(count / (double) PAGE_ROW_COUNT);

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
		
		List<BoardVO> list = dao.list(vo);
		for (int i = 0; i < list.size(); i++) {
			BoardVO boardVO = list.get(i);
			List<TagVO> tagList = dao2.list(boardVO.getBoard_no());
			boardVO.setTag(getTagName(tagList));
		}
		model.addAttribute("list", list);
	}
	
	private List<String> getTagName(List<TagVO> tagList) {
		List<String> tagName = new ArrayList<>();
		for (TagVO tagVO : tagList) {
			tagName.add(tagVO.getTag_name());
		}
		return tagName;
	}

}
