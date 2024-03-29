package com.kong.Service;

import java.util.List;

import com.kong.domain.CartListVO;
import com.kong.domain.CartVO;
import com.kong.domain.Criteria;
import com.kong.domain.OrderDetailVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.SearchCriteria;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemReplyVO;
import com.kong.domain.itemVO;
import com.kong.domain.itemViewVO;

public interface ShopService {

	// 카테고리별 상품 리스트
	public List<itemViewVO> list(int cateCode, int level) throws Exception;

	// 상품 조회
	public itemViewVO itemView(int itemNum) throws Exception;

	// 상품 소감(댓글) 작성
	public void registerReply(itemReplyVO reply) throws Exception;

	// 상품 소감(댓글) 리스트
	public List<itemReplyListVO> replyList(int itemNum) throws Exception;

	// 상품 소감(댓글) 삭제
	public void deleteReply(itemReplyVO vo) throws Exception;

	// 아이디 체크
	public String idCheck(int repNum) throws Exception;

	// 상품 소감(댓글) 수정
	public void modifyReply(itemReplyVO reply) throws Exception;

	// 카드 담기
	public int addCart(CartListVO cart) throws Exception;

	// 카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;

	// 카트 삭제
	public int deleteCart(CartVO cart) throws Exception;

	// 카트 중복 확인
	public CartListVO cartCheck(CartListVO vo) throws Exception;

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

	// 평점순 상품 정보
	public List<itemViewVO> likeSelect() throws Exception;

	// 전체 상품 검색
	public List<itemViewVO> search(SearchCriteria scri) throws Exception;

	// 상품 총 갯수
	public int itemGetTotal(Criteria cri) throws Exception;

	// 신규 상품 정보
	public List<itemViewVO> newSelect() throws Exception;

}
