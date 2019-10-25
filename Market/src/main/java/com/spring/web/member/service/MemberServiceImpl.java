package com.spring.web.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.web.member.dao.MemberDAO;
import com.spring.web.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	
	@Override
	public void insertMember(MemberVO memberVO) {

		dao.insertMember(memberVO);
	}


	@Override
	public int getLogin(MemberVO memberVO) {
		
		return dao.getLogin(memberVO);
	}


	@Override
	public MemberVO getInfo(MemberVO memberVO) {
		
		return dao.getInfo(memberVO);
	}


	@Override
	public void deleteMember(MemberVO memberVO) {

		dao.deleteMember(memberVO);
	}


	@Override
	public int getLoginProc(MemberVO memberVO) {
		
		int result = dao.getLoginProc(memberVO);
		return result;
	}


	@Override
	public int updateMember(MemberVO memberVO) {
		
		int result = dao.updateMember(memberVO);
		return result;

	}

}
