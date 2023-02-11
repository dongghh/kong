<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header.jsp"%>
<style>
#container {
	width: 70%;
	margin-top: 20px;
	margin: auto;
}

section#container ul {
	text-align: center;
}

section#container ul li {
	display: inline-block;
	margin: 10px;
}

section#container div.itemThumb img {
	width: 200px;
	height: 200px;
	border-radius : 15px 15px;
}

section#container div.itemName {
	padding: 10px 0 10px 0;
	text-align: left;
}

section#container div.itemName a {
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
	float: left;
}

#item-box {
	border-radius: 20px 20px 20px 20px;
	box-sizing: border-box;
}
</style>
<body>
	<section id="container">
		<ul>
			<c:forEach items="${list}" var="list">
				<li id="item-box">
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
						<span id="price"><fmt:formatNumber
								value="${list.itemPrice}" pattern="###,###,###" />원</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</section>
	<%@include file="../layout/footer.jsp"%>