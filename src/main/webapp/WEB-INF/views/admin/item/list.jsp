<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="/resources/css/admin-itemList.css">
</head>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<section id="container">
		<h2 id="title">상품 목록</h2>
		<table id="itemTable">
			<tr style="height: 30px;">
				<th>번호</th>
				<th>이름</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>수량</th>
				<th>등록날짜</th>
				<th>수정</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><img src="${list.itemThumbImg}"></td>
					<td><a href="/admin/item/view?n=${list.itemNum}">${list.itemName}</a>
					</td>
					<td>${list.cateCode}-${list.cateName}</td>
					<td><fmt:formatNumber value="${list.itemPrice}"
							pattern="###,###,###" /></td>
					<td>${list.itemStock}</td>
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yyyy-MM-dd" /></td>
							<td>
								<a href="/admin/item/view?n=${list.itemNum}">수정</a>
							</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<%@include file="/WEB-INF/views/layout/footer.jsp"%>