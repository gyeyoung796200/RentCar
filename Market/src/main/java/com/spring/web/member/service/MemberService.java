package com.spring.web.member.service;

import com.spring.web.member.vo.MemberVO;

public interface MemberService {

	//회원가입
	public void insertMember(MemberVO memberVO);

	//아이디가 존재하는지 확인
	public int getLogin(MemberVO memberVO);

	//상세정보
	public MemberVO getInfo(MemberVO memberVO);

	//회원탈퇴
	public void deleteMember(MemberVO memberVO);
	
	//아이디와 비밀번호로 값이 존재하는지
	public int getLoginProc(MemberVO memberVO);

	//회원정보 수정
	public int updateMember(MemberVO memberVO);

}
