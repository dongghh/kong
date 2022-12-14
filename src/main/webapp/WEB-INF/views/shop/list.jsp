<%@include file="../layout/header.jsp"%>
<style>
#container {
	width: 70%;
	margin: auto;
}

ul {
	text-align: center;
}

ul li {
	display: inline-block;
	margin: 10px;
}

div.itemThumb img {
	width: 200px;
	height: 200px;
}

div.itemName {
	padding: 20px 0 10px 0;
	text-align: left;
}

div.itemName a {
	color: #000;
	font-size: larger;
}

#Kong {
	font-size: small;
	float: left;
}

#span-box {
	margin-bottom: 10px;
}

#price {
	float: right;
}
</style>
<section id="container">
	<ul>
		<c:forEach items="${list}" var="list">
			<li>
				<div class="itemThumb">
					<img src="${list.itemThumbImg}">
				</div>
				<div id="span-box">
					<span id="Kong">kong</span>
				</div>
				<div class="itemName">
					<a href="/shop/view?n=${list.itemNum}">${list.itemName}</a>
				</div>
				<div id="price-box">
					<span id="price"><fmt:formatNumber value="${list.itemPrice}"
							pattern="###,###,###" />원</span>
				</div>
			</li>
		</c:forEach>
	</ul>
</section>
<%@include file="../layout/footer.jsp"%>