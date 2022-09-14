package com.kong.DAO;

import java.util.List;

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
		// vo에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace에
		// 아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.
		session.update(namespace + ".memberUpdate", vo);
	}

	// 업데이트와 마찬가지로 흐름은 같습니다.
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		// MemberVO에 담긴 값들을 보내줍니다.
		// 그럼 xml에서 memberMapper.memberDelete에 보시면
		// #{userId}, #{userPass}에 파라미터값이 매칭이 되겠지요.
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

}
