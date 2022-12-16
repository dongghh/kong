<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="/resources/css/admin-orderList.css">
</head>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<section id="container">
		<div id="container_box">
			<h2 id="title">주문 목록 관리</h2>
				<table class="orderList">
					<tr id="order-top">
						<th>주문번호</th>
						<th>주문</th>
						<th>수령</th>
						<th>주소</th>
						<th>가격</th>
						<th>상태</th>
					</tr>
					<c:forEach items="${orderList}" var="orderList">
						<tr id="order-bottom">
							<td><a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></td>
							<td>${orderList.userId}</td>
							<td>${orderList.orderRec}</td>
							<td>(${orderList.userAddr1})${orderList.userAddr2}
								${orderList.userAddr3}</td>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" />원</td>
							<td>${orderList.delivery}</td>
						<tr>
					</c:forEach>
				</table>
		</div>
	</section>
	<%@include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>