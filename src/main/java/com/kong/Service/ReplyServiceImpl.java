package com.kong.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kong.DAO.ReplyDAO;
import com.kong.domain.BoardReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO dao;

	// 댓글 조회
	@Override
	public List<BoardReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	// 댓글 쓰기
	@Override
	public void writeReply(BoardReplyVO vo) throws Exception {
		dao.writdReply(vo);
	}

	// 댓글 수정
	@Override
	public void updateReply(BoardReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(BoardReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}
	
	// 선택된 댓글 조회
	@Override
	public BoardReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

}
