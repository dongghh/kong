<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<head>
<style>
section {
	width: 70%;
	margin: auto;
}

.title {
	padding-top: 30px;
	margin: 40px 0;
	text-align: center;
}

.itemUl {
	margin: auto;
	width: 100%;
	text-align: center;
}

.itemUl li {
	list-style: none;
	display: inline-block;
	margin: 40px;
	width: 190px;
}

#Kong {
	font-size: small;
	float: left;
}

#span-box {
	margin-bottom: 10px;
}

.itemThumb {
	width: 180px;
	height: 200px;
}

#price-box {
	width: 200px;
	text-align: left;
}

.itemThumb img {
	width: 180px;
	height: 200px;
	border-radius: 15px 15px;
}

.itemName {
	padding: 15px 0 10px 0;
	text-align: left;
}

.itemName a {
	color: #000;
	font-size: larger;
}
</style>
</head>
<body>
	<section>
		<h2 class="title">${keyword} 검색 결과</h2>
		<ul class="itemUl">
			<c:forEach items="${list}" var="list" varStatus="List">
				<li id="itemLi">
					<a href="/shop/view?n=${ls.itemNum}">
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
							<span id="price"><fmt:formatNumber value="${list.itemPrice}" pattern="###,###,###" />원</span>
						</div>
					</a>
				</li>
				<c:if test="${List.count mod 4==0}">
					<br>
				</c:if>
			</c:forEach>
		</ul>
	</section>
</body>
<%@ include file="../layout/footer.jsp"%>