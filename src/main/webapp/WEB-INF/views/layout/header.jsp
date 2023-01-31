<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Kong</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/swiper.min.css">
<link rel="icon" href="/resources/favicon/favicon.ico"
	type="image/x-icon">
<link rel="shortcut icon" href="/resources/favicon/favicon.ico"
	type="image/x-icon" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/custom.js"></script>
<script type="text/javascript" src="/resources/js/swiper.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<header>
		<div id="header-top">
			<h1 id="logo">
				<a href="/">Kong</a>
			</h1>
			<div id="headerMenu">
				<c:if test="${member == null}">
					<ul>
						<li><a href="/member/login">Login</a></li>
						<li><a href="/member/register">Join</a></li>
						<li><a href="/shop/cartList">Cart</a></li>
						<li><a href="/shop/orderList">Order</a></li>
						<li><a href="/board/list">Notice</a></li>
					</ul>
				</c:if>
				<c:if test="${member != null }">
					<c:if test="${member.verify == 0 }">
						<ul>
							<li><p>${member.userName}님 환영합니다.</p></li>
							<li><a href="/member/logout">Logout</a></li>
							<li><a href="/member/memberUpdateView">MyInfo</a></li>
							<li><a href="/board/list">Notice</a></li>
							<li><a href="/shop/cartList">Cart</a></li>
							<li><a href="/shop/orderList">Order</a></li>
						</ul>
					</c:if>
					<c:if test="${member.verify == 9}">
						<ul>
							<li><p>${member.userName}님 환영합니다.</p></li>
							<li><a href="/member/logout">Logout</a></li>
							<li><a href="/admin/memberList">userList</a></li>
							<li><a href="/admin/item/register">itemRegister</a></li>
							<li><a href="/admin/item/list">itemList</a></li>
							<li><a href="/shop/orderList">Order</a></li>
							<li><a href="/shop/cartList">Cart</a></li>
							<li><a href="/admin/shop/orderList">orderList</a></li>
							<li><a href="/board/list">Notice</a></li>
						</ul>
					</c:if>
				</c:if>
			</div>
		</div>
		<hr id="header_hr">
		<div id="header-bottom">
			<ul>
				<li><a href="/shop/allList">전체상품</a></li>
				<li><a href="/shop/list?c=100&l=1">서재</a>
					<ul class="low">
						<li><a href="/shop/list?c=101&l=2">데스크</a></li>
						<li><a href="/shop/list?c=102&l=2">서랍장</a></li>
						<li><a href="/shop/list?c=103&l=2">책장</a></li>
					</ul></li>
				<li><a href="/shop/list?c=200&l=1">침실</a>
					<ul class="low">
						<li><a href="/shop/list?c=201&l=2">침대</a></li>
						<li><a href="/shop/list?c=202&l=2">행거</a></li>
						<li><a href="/shop/list?c=203&l=2">거울</a></li>
						<li><a href="/shop/list?c=204&l=2">서랍장</a></li>
					</ul></li>
				<li><a href="/shop/list?c=300&l=1">거실</a>
					<ul class="low">
						<li><a href="/shop/list?c=301&l=2">소파</a></li>
						<li><a href="/shop/list?c=302&l=2">거실장</a></li>
						<li><a href="/shop/list?c=303&l=2">테이블</a></li>
					</ul></li>
				<li><a href="/shop/list?c=400&l=1">주방</a>
					<ul class="low">
						<li><a href="/shop/list?c=401&l=2">테이블</a></li>
						<li><a href="/shop/list?c=402&l=2">수납장</a></li>
						<li><a href="/shop/list?c=403&l=2">의자</a></li>
					</ul></li>
			</ul>
		</div>
	</header>
</body>
</html>