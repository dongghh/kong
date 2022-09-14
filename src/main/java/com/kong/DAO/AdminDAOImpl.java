package com.kong.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kong.domain.CategoryVO;
import com.kong.domain.MemberVO;
import com.kong.domain.OrderListVO;
import com.kong.domain.OrderVO;
import com.kong.domain.itemReplyListVO;
import com.kong.domain.itemVO;
import com.kong.domain.itemViewVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	private String namespace = "com.kong.mapper.AdminMapper";

	@Inject
	SqlSession session;

	// 회원 목록
	@Override
	public List<MemberVO> memberList() throws Exception {
		return session.selectList(namespace + ".memberList");
	}

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return session.selectList(namespace + ".category");
	}

	// 상품 등록
	@Override
	public void register(itemVO vo) throws Exception {
		session.insert(namespace + ".register", vo);
	}

	// 상품 목록
	@Override
	public List<itemViewVO> itemlist() throws Exception {
		return session.selectList(namespace + ".itemlist");
	}

	// 상품 조회 + 카테고리 조인
	@Override
	public itemViewVO itemView(int itemNum) throws Exception {
		return session.selectOne(namespace + ".itemView", itemNum);
	}

	// 상품 수정
	@Override
	public void itemModify(itemVO vo) throws Exception {
		session.update(namespace + ".itemModify", vo);
	}

	// 상품 삭제
	@Override
	public void itemDelete(int itemNum) throws Exception {
		session.delete(namespace + ".itemDelete", itemNum);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return session.selectList(namespace + ".orderList");
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return session.selectList(namespace + ".orderView", order);
	}

	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		session.update(namespace + ".delivery", order);
	}

	// 상품 수량 조절
	@Override
	public void changeStock(itemVO item) throws Exception {
		session.update(namespace + ".changeStock", item);
	}

	// 모든 소감(댓글)
	@Override
	public List<itemReplyListVO> allReply() throws Exception {
		return session.selectList(namespace + ".allReply");
	}

	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		session.delete(namespace + ".deleteReply", repNum);

	}

}
