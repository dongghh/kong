<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section#content {
	width: 80%;
	margin: auto;
}

section#content ul li {
	display: inline-block;
	margin: 10px;
}

section#content div.itemThumb img {
	width: 200px;
	height: 200px;
}

section#content div.itemName {
	padding: 10px 0;
	text-align: center;
}

section#content div.itemName a {
	color: #000;
}
</style>
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">

		<section id="content">

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
	</section>
	<%@include file="../layout/footer.jsp"%>
</body>
</html>