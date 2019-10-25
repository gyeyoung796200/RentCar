package com.spring.web.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.web.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	
	@Inject
	private SqlSession sqlSession;
	

	@Override
	public void insertMember(MemberVO memberVO) {
		
		sqlSession.insert("com.spring.web.member.dao.MemberDAO.insertMember", memberVO);
	}

	@Override
	public int getLogin(MemberVO memberVO) {

		return sqlSession.selectOne("com.spring.web.member.dao.MemberDAO.getLogin", memberVO);
	}

	@Override
	public MemberVO getInfo(MemberVO memberVO) {
		
		return sqlSession.selectOne("com.spring.web.member.dao.MemberDAO.getInfo", memberVO);
	}


	@Override
	public void deleteMember(MemberVO memberVO) {
		
		sqlSession.delete("com.spring.web.member.dao.MemberDAO.deleteMember", memberVO);
	}

	@Override
	public int getLoginProc(MemberVO memberVO) {

		int result = sqlSession.selectOne("com.spring.web.member.dao.MemberDAO.getLoginProc",memberVO);
		
		return result;
	}

	@Override
	public int updateMember(MemberVO memberVO) {
		
		int result = sqlSession.update("com.spring.web.member.dao.MemberDAO.updateMember", memberVO);
		
		return result;
	}

}
