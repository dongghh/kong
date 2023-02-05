package com.kong.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kong.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private String namespace = "com.kong.mapper.MemberMapper";

	@Inject
	SqlSession session;

	@Override
	public void register(MemberVO vo) throws Exception {
		session.insert(namespace + ".register", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".login", vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		session.update(namespace + ".memberUpdate", vo);
	}

	//
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		session.delete(namespace + ".memberDelete", vo);

	}

	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = session.selectOne(namespace + ".passChk", vo);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = session.selectOne(namespace + ".idChk", vo);
		return result;
	}

	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".findId", vo);
	}

	// 비밀번호 찾기
	@Override
	public MemberVO findPw(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".findPw" ,vo);
	}

	// 비밀번호 변경
	@Override
	public int updatePw(MemberVO vo) throws Exception {
		return session.update(namespace + ".updatePw", vo);
	}

	// 해당 아이디 조회
	@Override
	public MemberVO readMember(String userid) throws Exception {
		return session.selectOne(namespace + ".readMember", userid);

	}

}
