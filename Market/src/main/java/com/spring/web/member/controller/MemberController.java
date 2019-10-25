package com.spring.web.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.mysql.cj.Session;
import com.spring.web.member.service.MemberService;
import com.spring.web.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	
	
	@RequestMapping("/joinForm")
	public ModelAndView joinForm() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("center", "member/joinForm.jsp");
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/joinProc")
	public ModelAndView joinProc(MemberVO memberVO,HttpSession session,RedirectAttributes rrdr) {
		
		//해당 아이디로 존재하는지 파악해서 존재하면 1 아니면 0을 넘긴다
		int result = memberService.getLogin(memberVO);
		
		if(result == 1) {
			
			rrdr.addFlashAttribute("result", "1");
			rrdr.addFlashAttribute("center", "member/joinForm.jsp");
			
			return new ModelAndView(new RedirectView("/"));
		}
		
		else {
			
			memberService.insertMember(memberVO);
			session.setAttribute("memberVO", memberVO);
			session.setMaxInactiveInterval(60*30);
			
//			return new ModelAndView(new RedirectView("/web/"));
			return new ModelAndView(new RedirectView("/"));
		}
	}
	
	@RequestMapping("/loginForm")
	public ModelAndView loginForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("center", "member/loginForm.jsp");
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/loginProc")
	public ModelAndView loginProc(MemberVO memberVO,HttpSession session,RedirectAttributes rerr) {
		
		
//		ModelAndView mav = new ModelAndView();
		
		int result = memberService.getLoginProc(memberVO);
		
		
		if(result == 1) {
			
			session.setAttribute("memberVO", memberVO);
			session.setMaxInactiveInterval(60*30);
			
			return new ModelAndView(new RedirectView("/"));
		}
		
		else {
				rerr.addFlashAttribute("result", "2");
//				mav.addObject("result", "2");
//				mav.addObject("center", "member/loginForm.jsp");
//				mav.setViewName("index");
			return new ModelAndView(new RedirectView("/member/loginForm"));
				
		}
	}
	
	@RequestMapping("/logOut")
	public ModelAndView logOut(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		
		mav.addObject("center", "member/loginForm.jsp");
		mav.setViewName("index");
		return mav;
		
	}
	
	
	
	
	@RequestMapping("/info")
	public ModelAndView info(MemberVO memberVO) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memberVO", memberService.getInfo(memberVO));
		mav.addObject("center", "member/info.jsp");
		mav.setViewName("index");
		
		return mav;
	}
	
	@RequestMapping("/deleteMember")
	public ModelAndView deleteMember(MemberVO memberVO, HttpSession session) {
		
		
		memberService.deleteMember(memberVO);
		
		session.invalidate();
		
		return new ModelAndView(new RedirectView("/"));
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(MemberVO memberVO) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("center", "member/modifyForm.jsp");
		mav.setViewName("index");
		
		return mav;
	}
	
	@RequestMapping("/modifyProc")
	public ModelAndView modifyProc(MemberVO memberVO, RedirectAttributes rddr) {
		
		ModelAndView mav = new ModelAndView();
		
		int result = memberService.updateMember(memberVO);
		
		if(result == 1) {
			
			
			mav.addObject("result", "1");
			mav.addObject("memberVO",memberVO);
			mav.addObject("center", "member/info.jsp");
			mav.setViewName("index");
		}
		
		else {
			
			mav.addObject("result", "2");
			mav.addObject("center", "member/info.jsp");
			mav.setViewName("index");
		}
		
		return mav;
	}
	
	
}
