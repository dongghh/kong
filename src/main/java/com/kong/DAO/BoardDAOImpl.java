package com.kong.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kong.domain.BoardVO;
import com.kong.domain.MemberVO;
import com.kong.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.kong.mapper.BoardMapper";

	// 게시글 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);

	}

	// 게시글 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return session.selectList(namespace + ".listPage", scri);

	}

	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {

		return session.selectOne(namespace + ".listCount", scri);

	}

	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {

		return session.selectOne(namespace + ".read", bno);
	}

	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {

		session.update(namespace + ".update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {

		session.delete(namespace + ".delete", bno);
	}
	// 게시물 조회수
	@Override
	public void boardCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".boardCnt", bno);
	}
}
