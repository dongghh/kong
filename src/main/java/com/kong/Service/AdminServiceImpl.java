package com.kong.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kong.DAO.AdminDAO;
import com.kong.domain.CategoryVO;
import com.kong.domain.MemberVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemVO;
import com.kong.domain.itemViewVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// 회원 목록
	@Override
	public List<MemberVO> memberList() throws Exception {
		return dao.memberList();
	}

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	// 상품 등록
	@Override
	public void register(itemVO vo) throws Exception {
		dao.register(vo);
	}

	// 상품 목록
	@Override
	public List<itemViewVO> itemlist() throws Exception {
		return dao.itemlist();
	}

	// 상품 조회 + 카테고리 조인
	@Override
	public itemViewVO itemView(int itemNum) throws Exception {
		return dao.itemView(itemNum);
	}

	// 상품 수정
	@Override
	public void itemModify(itemVO vo) throws Exception {
		dao.itemModify(vo);
	}

	// 상품 삭제
	@Override
	public void itemDelete(int itemNum) throws Exception {
		dao.itemDelete(itemNum);

	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}

	// 상품 수량 조절
	@Override
	public void changeStock(itemVO item) throws Exception {
		dao.changeStock(item);
	}

	// 모든 소감(댓글)
	@Override
	public List<itemReplyListVO> allReply() throws Exception {
		return dao.allReply();
	}

	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		dao.deleteReply(repNum);

	}

}
