package com.kong.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kong.domain.CategoryVO;
import com.kong.domain.MemberVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemVO;
import com.kong.domain.itemViewVO;

@Repository
public interface AdminDAO {

	// 회원 목록
	public List<MemberVO> memberList() throws Exception;

	// 카테고리
	public List<CategoryVO> category() throws Exception;

	// 상품 등록
	public void register(itemVO vo) throws Exception;

	// 상품 목록
	public List<itemViewVO> itemlist() throws Exception;

	// 상품 조회 + 카테고리 조인
	public itemViewVO itemView(int itemNum) throws Exception;

	// 상품 수정
	public void itemModify(itemVO vo) throws Exception;

	// 상품 삭제
	public void itemDelete(int itemNum) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList() throws Exception;

	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 배송 상태
	public void delivery(OrderVO order) throws Exception;

	// 상품 수량 조절
	public void changeStock(itemVO item) throws Exception;

	// 모든 소감(댓글)
	public List<itemReplyListVO> allReply() throws Exception;

	// 소감(댓글) 삭제
	public void deleteReply(int repNum) throws Exception;
}