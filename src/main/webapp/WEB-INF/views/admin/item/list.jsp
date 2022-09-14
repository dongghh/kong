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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<section id="container">
		<section id="content">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>수량</th>
						<th>등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><img src="${list.itemThumbImg}"></td>
							<td><a href="/admin/item/view?n=${list.itemNum}">${list.itemName}</a>
							</td>
							<td>${list.cateName}</td>
							<td><fmt:formatNumber value="${list.itemPrice}"
									pattern="###,###,###" /></td>
							<td>${list.itemStock}</td>
							<td><fmt:formatDate value="${list.regDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</section>
	<%@include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>