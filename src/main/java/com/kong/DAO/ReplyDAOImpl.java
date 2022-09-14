package com.kong.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kong.domain.BoardReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private String namespace = "com.kong.mapper.replyMapper";

	@Inject
	SqlSession session;

	// 댓글조회
	@Override
	public List<BoardReplyVO> readReply(int bno) throws Exception {
		return session.selectList(namespace + ".readReply", bno);
	}

	// 댓글 쓰기
	@Override
	public void writdReply(BoardReplyVO vo) throws Exception {
		session.insert(namespace + ".writeReply", vo);
	}

	// 댓글 수정
	@Override
	public void updateReply(BoardReplyVO vo) throws Exception {
		session.update(namespace + ".updateReply", vo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(BoardReplyVO vo) throws Exception {
		session.delete(namespace + ".deleteReply", vo);
	}

	// 선택된 댓글 조회
	@Override
	public BoardReplyVO selectReply(int rno) throws Exception {
		return session.selectOne(namespace + ".selectReply", rno);
	}

}
