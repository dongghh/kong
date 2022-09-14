<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="/resources/css/admin-list.css">
<style>
section#content {
	height: 80%;
	width: 80%;
	margin: auto;
}

div#container_box ul li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

div#container_box .orderList span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<section id="container">
		<div id="container_box">
			<section id="content">

				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
						<li>
							<div>
								<p>
									<span>주문번호</span> <a
										href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
								</p>
								<p>
									<span>주문자</span> ${orderList.userId}
								</p>
								<p>
									<span>수령인</span> ${orderList.orderRec}
								</p>
								<p>
									<span>주소</span> (${orderList.userAddr1}) ${orderList.userAddr2}
									${orderList.userAddr3}
								</p>
								<p>
									<span>가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${orderList.amount}" />
									원
								</p>
								<p>
									<span>상태</span> ${orderList.delivery}
								</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</section>
		</div>
	</section>
	<%@include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>