package com.spring.web.member.dao;

import com.spring.web.member.vo.MemberVO;

public interface MemberDAO {
	
	public void insertMember(MemberVO memberVO);
	
	//아이디가 존재하는지 파악
	public int getLogin(MemberVO memberVO);

	public MemberVO getInfo(MemberVO memberVO);
	
	public void deleteMember(MemberVO memberVO);
	
	public int getLoginProc(MemberVO memberVO);
	
	public int updateMember(MemberVO memberVO);
}
