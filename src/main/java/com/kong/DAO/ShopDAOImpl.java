package com.kong.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kong.domain.CartListVO;
import com.kong.domain.CartVO;
import com.kong.domain.OrderDetailVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemReplyVO;
import com.kong.domain.itemViewVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	SqlSession session;

	private String namespace = "com.kong.mappers.shopMapper";

	// 카테고리별 상품 리스트 : 1차 분류
	@Override
	public List<itemViewVO> list(int cateCode, int cateCodeRef) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);

		return session.selectList(namespace + ".list_1", map);
	}

	// 카테고리별 상품 리스트 : 2차 분류
	@Override
	public List<itemViewVO> list(int cateCode) throws Exception {

		return session.selectList(namespace + ".list_2", cateCode);
	}

	// 상품 조회
	@Override
	public itemViewVO itemView(int itemNum) throws Exception {
		return session.selectOne(namespace + ".itemView", itemNum);

	}

	// 상품 소감(댓글) 작성
	@Override
	public void registerReply(itemReplyVO reply) throws Exception {
		session.insert(namespace + ".registerReply", reply);
	}

	// 상품 소감(댓글) 리스트
	@Override
	public List<itemReplyListVO> replyList(int itemNum) throws Exception {
		return session.selectList(namespace + ".replyList", itemNum);
	}

	// 상품 소감(댓글) 삭제
	@Override
	public void deleteReply(itemReplyVO reply) throws Exception {
		session.delete(namespace + ".deleteReply", reply);
	}

	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return session.selectOne(namespace + ".replyUserIdCheck", repNum);
	}

	// 상품 소감(댓글) 수정
	@Override
	public void modifyReply(itemReplyVO reply) throws Exception {
		session.update(namespace + ".modifyReply", reply);
	}

	// 카드 담기
	@Override
	public void addCart(CartListVO cart) throws Exception {
		session.insert(namespace + ".addCart", cart);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return session.selectList(namespace + ".cartList", userId);
	}

	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		session.delete(namespace + ".deleteCart", cart);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		session.insert(namespace + ".orderInfo", order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		session.insert(namespace + ".orderInfo_Details", orderDetail);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		session.delete(namespace + ".cartAllDelete", userId);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return session.selectList(namespace + ".orderList", order);
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return session.selectList(namespace + ".orderView", order);
	}

	// 전체 상품 리스트
	@Override
	public List<itemViewVO> allList() throws Exception {
		return session.selectList(namespace + ".allList");
	}

	// 평점 평균 구하기
	@Override
	public Double getRatingAverage(int itemNum) throws Exception {
		return session.selectOne(namespace + ".getRatingAverage", itemNum);
	}

	@Override
	// 평점 평균 반영하기
	public int updateRating(itemReplyVO vo) throws Exception {
		return session.update(namespace + ".updateRating" , vo);
	}
	
	@Override
	//평점순 상품 정보
	public List<itemViewVO> likeSelect() throws Exception{
		return session.selectList(namespace + ".likeSelect");
	}

}
