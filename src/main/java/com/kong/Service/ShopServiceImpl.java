package com.kong.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kong.DAO.ShopDAO;
import com.kong.domain.CartListVO;
import com.kong.domain.CartVO;
import com.kong.domain.Criteria;
import com.kong.domain.OrderDetailVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.SearchCriteria;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemReplyVO;
import com.kong.domain.itemViewVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;

	// 카테고리별 상품 리스트
	@Override
	public List<itemViewVO> list(int cateCode, int level) throws Exception {

		int cateCodeRef = 0; // 카테고리 참조 코드. 없어도 무관

		if (level == 1) { // lavel 1 = 1차 분류.

			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
			// 두가지 모두 cateCode로 해도 무관

		} else { // lavel 2 = 2차 분류

			return dao.list(cateCode);

		}

	}

	// 상품 조회
	@Override
	public itemViewVO itemView(int itemNum) throws Exception {
		return dao.itemView(itemNum);
	}

	// 상품 소감(댓글) 작성
	@Override
	public void registerReply(itemReplyVO reply) throws Exception {
		dao.registerReply(reply);
		setRating(reply.getItemNum());

	}

	// 상품 소감(댓글) 리스트
	@Override
	public List<itemReplyListVO> replyList(int itemNum) throws Exception {
		return dao.replyList(itemNum);
	}

	// 상품 소감(댓글) 삭제
	@Override
	public void deleteReply(itemReplyVO reply) throws Exception {
		dao.deleteReply(reply);
		setRating(reply.getItemNum());
	}

	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}

	// 상품 소감(댓글) 수정
	public void modifyReply(itemReplyVO reply) throws Exception {
		dao.modifyReply(reply);
		setRating(reply.getItemNum());
	}

	// 카드 담기
	@Override
	public int addCart(CartListVO cart) throws Exception {

		// 장바구니 데이터 체크
		CartListVO checkCart = dao.cartCheck(cart);

		if (checkCart != null) {
			return 2;
		}

		// 장바구니 등록 & 에러 시 0반환
		try {
			return dao.addCart(cart);
		} catch (Exception e) {
			return 0;
		}

	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}

	// 카트 삭제
	@Override
	public int deleteCart(CartVO cart) throws Exception {
		return dao.deleteCart(cart);
	}

	// 카트 중복 확인
	@Override
	public CartListVO cartCheck(CartListVO vo) throws Exception {
		return dao.cartCheck(vo);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	// 전체 상품 리스트
	@Override
	public List<itemViewVO> allList() throws Exception {
		return dao.allList();
	}

	// 평점순 상품 정보
	@Override
	public List<itemViewVO> likeSelect() throws Exception {
		return dao.likeSelect();

	}

	@Override
	// 전체 상품 검색
	public List<itemViewVO> search(SearchCriteria scri) throws Exception {
		return dao.search(scri);
	}

	@Override
	// 상품 총 갯수
	public int itemGetTotal(Criteria cri) throws Exception {
		return dao.itemGetTotal(cri);
	}

	@Override
	// 신규 상품 정보
	public List<itemViewVO> newSelect() throws Exception {
		return dao.newSelect();
	}

	// 평점 메서드
	public void setRating(int itemNum) throws Exception {
		Double ratingAvg = dao.getRatingAverage(itemNum);

		if (ratingAvg == null) {
			ratingAvg = 0.0;
		}

		itemReplyVO vo = new itemReplyVO();
		vo.setItemNum(itemNum);
		vo.setRatingAvg(ratingAvg);

		dao.updateRating(vo);
	}
}
