<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#content {
	width: 80%;
	margin: auto;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}

.orderView li {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999;
}

.orderView li::after {
	content: "";
	display: block;
	clear: both;
}

.thumb {
	float: left;
	width: 200px;
}

.thumb img {
	width: 200px;
	height: 200px;
}

.itemInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
}

.itemInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}
</style>
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<section id="content">

			<div class="orderInfo">
				<c:forEach items="${orderView}" var="orderView" varStatus="status">

					<c:if test="${status.first}">
						<p>
							<span>수령인</span> ${orderView.orderRec}
						</p>
						<p>
							<span>주소</span> (${orderView.userAddr1}) ${orderView.userAddr2}
							${orderView.userAddr3}
						</p>
						<p>
							<span>가격</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${orderView.amount}" />
							원
						</p>
						<p>
							<span>상태</span>${orderView.delivery}</p>
					</c:if>

				</c:forEach>
			</div>

			<ul class="orderView">
				<c:forEach items="${orderView}" var="orderView">
					<li>
						<div class="thumb">
							<img src="${orderView.itemThumbImg}" />
						</div>
						<div class="itemInfo">
							<p>
								<span>상품명</span> ${orderView.itemName}<br /> <span>개당 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.itemPrice}" />
								원<br /> <span>구입 수량</span> ${orderView.cartStock} 개<br /> <span>최종
									가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.itemPrice * orderView.cartStock}" />
								원
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>
	</section>
</body>
</html>