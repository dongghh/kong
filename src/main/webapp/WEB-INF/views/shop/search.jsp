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
	margin: 20px 0;
	text-align: center;
}

.search_info {
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

/* 검색 box */
.search-bar {
	display: flex;
}

.search-bar input, .search-btn, .search-btn:before, .search-btn:after {
	transition: all 0.25s ease-out;
}

.search-bar input, .search-btn {
	width: 3em;
	height: 3em;
}

.search-bar input:invalid:not(:focus), .search-btn {
	cursor: pointer;
}

.search-bar, .search-bar input:focus, .search-bar input:valid {
	width: 100%;
}

.search-bar input:focus, .search-bar input:not(:focus)+.search-btn:focus
	{
	outline: transparent;
}

.search-bar {
	margin: auto;
	padding: 1.5em;
	justify-content: center;
	max-width: 35em;
}

.search-bar input {
	background: transparent;
	border-radius: 1.5em;
	box-shadow: 0 0 0 0.4em #171717 inset;
	padding: 0.75em;
	transform: translate(0.5em, 0.5em) scale(0.5);
	transform-origin: 100% 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.search-bar input::-webkit-search-decoration {
	-webkit-appearance: none;
}

.search-bar input:focus, .search-bar input:valid {
	background: #fff;
	border-radius: 0.375em 0 0 0.375em;
	box-shadow: 0 0 0 0.1em #d9d9d9 inset;
	transform: scale(1);
}

.search-btn {
	background: #171717;
	border-radius: 0 0.75em 0.75em 0/0 1.5em 1.5em 0;
	padding: 0.75em;
	position: relative;
	transform: translate(0.25em, 0.25em) rotate(45deg) scale(0.25, 0.125);
	transform-origin: 0 50%;
}

.search-btn:before, .search-btn:after {
	content: "";
	display: block;
	opacity: 0;
	position: absolute;
}

.search-btn:before {
	border-radius: 50%;
	box-shadow: 0 0 0 0.2em #f1f1f1 inset;
	top: 0.75em;
	left: 0.75em;
	width: 1.2em;
	height: 1.2em;
}

.search-btn:after {
	background: #f1f1f1;
	border-radius: 0 0.25em 0.25em 0;
	top: 51%;
	left: 51%;
	width: 0.75em;
	height: 0.25em;
	transform: translate(0.2em, 0) rotate(45deg);
	transform-origin: 0 50%;
}

.search-btn span {
	display: inline-block;
	overflow: hidden;
	width: 1px;
	height: 1px;
}

/* Active state */
.search-bar input:focus+.search-btn, .search-bar input:valid+.search-btn
	{
	background: lightgray;
	border-radius: 0 0.375em 0.375em 0;
	transform: scale(1);
}

.search-bar input:focus+.search-btn:before, .search-bar input:focus+.search-btn:after,
	.search-bar input:valid+.search-btn:before, .search-bar input:valid+.search-btn:after
	{
	opacity: 1;
}

.search-bar input:focus+.search-btn:hover, .search-bar input:valid+.search-btn:hover,
	.search-bar input:valid:not(:focus)+.search-btn:focus {
	background: #0c48db;
}

.search-bar input:focus+.search-btn:active, .search-bar input:valid+.search-btn:active
	{
	transform: translateY(1px);
}

@media screen and (prefers-color-scheme: dark) {
	body, input {
		color: #f1f1f1;
	}
	body {
		background: #171717;
	}
	.search-bar input {
		box-shadow: 0 0 0 0.4em #f1f1f1 inset;
	}
	.search-bar input:focus, .search-bar input:valid {
		background: #3d3d3d;
		box-shadow: 0 0 0 0.1em #3d3d3d inset;
	}
	.search-btn {
		background: #f1f1f1;
	}
}
</style>
</head>
<body>
	<section>
		<h2 class="title">${scri.keyword}</h2>
		<p class="search_info">(으)로 ${count}개의 상품이 검색되었습니다.</p>

		<form id="searchForm" action="/shop/search" method="get"
			class="search-bar">
			<input type="search" name="keyword" pattern=".*\S.*"
				placeholder="상품명을 검색해주세요." value="${scri.keyword}" required>
			<button class="search-btn" id="SearchBtn" type="submit">
				<span>Search</span>
			</button>
		</form>

		<ul class="itemUl">
			<c:forEach items="${list}" var="list" varStatus="List">
				<li id="itemLi"><a href="/shop/view?n=${ls.itemNum}">
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
				</a></li>
				<c:if test="${List.count mod 4==0}">
					<br>
				</c:if>
			</c:forEach>
		</ul>
	</section>
</body>
<%@ include file="../layout/footer.jsp"%>