package com.kong.Service;

import java.util.List;

import com.kong.domain.BoardReplyVO;

public interface ReplyService {

	// 댓글 조회
	public List<BoardReplyVO> readReply(int bno) throws Exception;

	// 댓글 작성
	public void writeReply(BoardReplyVO vo) throws Exception;

	// 댓글 수정
	public void updateReply(BoardReplyVO vo) throws Exception;

	// 댓글 삭제
	public void deleteReply(BoardReplyVO vo) throws Exception;
	
	// 선택된 댓글 조회
	public BoardReplyVO selectReply(int rno) throws Exception;

}
