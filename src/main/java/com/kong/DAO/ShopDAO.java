package com.kong.DAO;

import java.util.List;

import com.kong.domain.CartListVO;
import com.kong.domain.CartVO;
import com.kong.domain.OrderDetailVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemReplyVO;
import com.kong.domain.itemViewVO;

public interface ShopDAO {

	// 카테고리별 상품 리스트 : 1차 분류
	public List<itemViewVO> list(int cateCode, int cateCodeRef) throws Exception;

	// 카테고리별 상품 리스트 : 2차 분류
	public List<itemViewVO> list(int cateCode) throws Exception;

	// 상품 조회
	public itemViewVO itemView(int itemNum) throws Exception;

	// 상품 소감(댓글) 작성
	public void registerReply(itemReplyVO reply) throws Exception;

	// 상품 소감(댓글) 리스트
	public List<itemReplyListVO> replyList(int itemNum) throws Exception;

	// 상품 소감(댓글) 삭제
	public void deleteReply(itemReplyVO reply) throws Exception;

	// 아이디 체크
	public String idCheck(int repNum) throws Exception;

	// 상품 소감(댓글) 수정
	public void modifyReply(itemReplyVO reply) throws Exception;

	// 카드 담기
	public void addCart(CartListVO cart) throws Exception;

	// 카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;

	// 카트 삭제
	public void deleteCart(CartVO cart) throws Exception;

	// 주문 정보
	public void orderInfo(OrderVO order) throws Exception;

	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;

	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 전체 상품 리스트
	public List<itemViewVO> allList() throws Exception;

	// 평점 평균 구하기
	public Double getRatingAverage(int itemNum) throws Exception;

	// 평점 평균 반영하기
	public int updateRating(itemReplyVO vo) throws Exception;
	
	//평점순 상품 정보
	public List<itemViewVO> likeSelect() throws Exception;

}
