package com.spring.web.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.web.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/boardList")
	public ModelAndView boardList() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("center", "board/boardList.jsp");
		mav.setViewName("index");
		
		return mav;
	}
	
	
}
