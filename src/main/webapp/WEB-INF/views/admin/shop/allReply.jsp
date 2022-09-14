<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container_box {
	width: 80%;
	margin: auto;
}

#container_box ul li {
	margin-bottom: 20px;
	border: 10px solid #eee;
}

.replyInfo {
	background: #eee;
	padding: 10px;
	font-size: 18px;
}

.replyInfo span {
	font-size: 20px;
	font-weight: bold;
	margin-right: 20px;
}

.replyContent {
	padding: 10px;
}

.replyControll {
	text-align: right;
	padding: 10px;
}

.replyControll button {
	border: 2px solid #999;
	background: #fff;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<section id="container">
		<div id="container_box">
			<ul>
				<c:forEach items="${reply}" var="reply">
					<li>
						<div class="replyInfo">
							<p>
								<span>작성자</span> ${reply.userName} (${reply.userId})
							</p>
							<p>
								<span>작성된 상품</span> <a href="/shop/view?n=${reply.itemNum}">바로가기</a>
							</p>
						</div>
						<div class="replyContent">${reply.repCon}</div>
						<div class="replyControll">
							<form role="form" method="post">
								<input type="hidden" name="repNum" value="${reply.repNum}" />
								<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
							</form>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
</body>
</html>