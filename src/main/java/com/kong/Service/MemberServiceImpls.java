package com.kong.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.kong.DAO.MemberDAO;
import com.kong.domain.MemberVO;

@Service
public class MemberServiceImpls implements MemberService {

	@Inject
	MemberDAO dao;
	
    //회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);

	}
	
    // 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	// 회원수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);

	}
	
	//회원탈퇴 
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	// 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		return dao.findId(vo);
	}

	// 비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		dao.findPw(vo);
	}

	// 해당 아이디 조회
	public MemberVO readMember(String userid) throws Exception {
		return dao.readMember(userid);
	}
	
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception{
		return dao.updatePw(vo);
	}

}
