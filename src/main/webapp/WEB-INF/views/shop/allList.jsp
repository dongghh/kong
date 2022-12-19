<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kong</title>
<style>
#container {
	width: 70%;
	margin-top: 20px;
	margin: auto;
}

section#container ul {
	text-align : center;
}

section#container ul li {
	display: inline-block;
	margin: 10px;
}

section#container div.itemThumb img {
	width: 200px;
	height: 200px;
}

section#container div.itemName {
	padding: 10px 0;
	text-align: center;
}

section#container div.itemName a {
	color: #000;
}
</style>
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<ul>
			<c:forEach items="${list}" var="list">
				<li>
					<div class="itemThumb">
						<img src="${list.itemThumbImg}">
					</div>
					<div class="itemName">
						<a href="/shop/view?n=${list.itemNum}">${list.itemName}</a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</section>
	<%@include file="../layout/footer.jsp"%>
</body>
</html>