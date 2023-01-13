<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header.jsp"%>
<style>
#container {
	width: 70%;
	margin: auto;
}

#itemList {
	text-align: center;
}

#itemList li {
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
	<ul id="itemList">
		<c:forEach items="${list}" var="list" varStatus="list">
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
			<c:if test="${list.count mod 4==0}">
				<br>
			</c:if>
		</c:forEach>
	</ul>
</section>
<%@include file="../layout/footer.jsp"%>