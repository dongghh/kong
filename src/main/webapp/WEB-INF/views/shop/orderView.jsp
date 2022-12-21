<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/orderView.css">
<section id="container">
	<h2 id="title">주문 조회</h2>
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
					<fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" />
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
<%@include file="../layout/footer.jsp"%>