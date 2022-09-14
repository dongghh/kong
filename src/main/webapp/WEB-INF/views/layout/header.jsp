<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 1784px;
	background-color: #fff;
}

header {
	width: 80%;
	height: 10%;
	background-color: dddddd;
	margin: auto;
}

#container {
	margin-top: 30px;
	margin-bottom: 30px;
}

* {
	margin: 0;
	padding: 0;
	font-family: NanumBarunGothic;
	word-break: keep-all;
	box-sizing: border-box;
}

a {
	color: black;
	text-decoration: none;
}

ul {
	list-style: none;
}

#header-top {
	height: 70%;
}

#header-top ul {
	float: right;
}

#header-top-top {
	display: inline-block;
}

#header-top-bottom {
	display: inline-block;
	float: right;
}

#header-top-bottom ul li {
	text-align: center;
}

#header-bottom a {
	color: black;
	text-decoration: none;
	margin: auto;
}

#header-bottom a:hover {
	text-decoration: underline;
}

#header-bottom li {
	float: left;
	margin-right: 20px;
	position: relative;
}

#header-bottom {
	height: 30%;
}

#header-bottom li:hover {
	background: #eee;
}

#header-bottom li>ul.low {
	display: none;
	position: absolute;
	top: 0;
	left: 180px;
}

#header-bottom li:hover>ul.low {
	display: block;
}

#header-bottom li:hover>ul.low li a {
	background: #eee;
	border: 1px solid #eee;
}

#header-bottom li:hover>ul.low li a:hover {
	background: #fff;
}

#header-bottom li>ul.low li {
	width: 180px;
}
</style>
</head>
<body>
	<header>
		<div id="header-top">
			<div id="header-top-top">
				<h1>
					<a href="/">Style Two</a> <span>Example Tagline Text</span>
				</h1>
			</div>
			<div id="header-top-bottom">
				<ul>
					<li>login</li>
					<li>join</li>
					<li><a href="/shop/cartList">cart</a></li>
					<li><a href="/shop/orderList">order</a></li>
					<li><input></li>
				</ul>
			</div>
		</div>
		<div id="header-bottom">
			<ul>
				<li><a href="/">BEST</a></li>
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
	<hr>
</body>
</html>