package com.kong.DAO;

import com.kong.domain.MemberVO;

public interface MemberDAO {

	// 회원가입
	public void register(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;

	// 회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;

	// 회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;

	// 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;

	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	// 아이디 찾기
	public MemberVO findId(MemberVO vo) throws Exception;

	// 비밀번호 찾기
	public MemberVO findPw(MemberVO vo) throws Exception;

	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;
	
	// 해당 아이디 조회
	public MemberVO readMember(String userid) throws Exception;

}
