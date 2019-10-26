package com.spring.web.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.web.board.service.BoardService;
import com.spring.web.member.vo.MemberVO;

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
	
	@RequestMapping("/boardWrite")
	public ModelAndView boardWrite(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		
		if(memberVO == null) {
			
			mav.addObject("center", "member/loginForm.jsp");
			mav.setViewName("index");
		}
		
		else if(memberVO != null) {
		mav.addObject("center", "board/writeForm.jsp");
		mav.addObject("memberVO", memberVO);
		mav.setViewName("index");
		}
		
		return mav;
	}
	
	
}
