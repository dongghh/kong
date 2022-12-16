<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/orderList.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<div id="container_box">
			<h2 id="title">주문 목록</h2>
			<table id="orderTable">
				<tr id="order-top">
					<th>주문번호</th>
					<th>수령인</th>
					<th>주소</th>
					<th>가격</th>
					<th>상태</th>
				</tr>
				<c:forEach items="${orderList}" var="orderList">
					<tr id="order-bottom">
						<td><a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></td>
						<td>${orderList.orderRec}</td>
						<td>(${orderList.userAddr1})
							${orderList.userAddr2}${orderList.userAddr3}</td>
						<td><fmt:formatNumber pattern="###,###,###"
								value="${orderList.amount}" /> 원</td>
						<td>${orderList.delivery}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<%@include file="../layout/footer.jsp"%>