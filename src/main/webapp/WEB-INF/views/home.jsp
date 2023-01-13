<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="layout/header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<title>Kong</title>
<section>
	<div class="sslide-wrap">
		<div class="swiper mySwiper sslide">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="/images/slide_1.jpg" alt="slide_1">
				</div>
				<div class="swiper-slide">
					<img src="/images/slide_2.jpg" alt="slide_2">
				</div>
				<div class="swiper-slide">
					<img src="/images/slide_3.jpg" alt="slide_3">
				</div>
				<div class="swiper-slide">
					<img src="/images/slide_4.jpg" alt="slide_4">
				</div>
				<div class="swiper-slide">
					<img src="/images/slide_5.jpg" alt="slide_5">
				</div>

			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	
	<form id="searchForm" action="shop/search" method="get" class="search-bar">
		<input type="search" name="keyword" pattern=".*\S.*" placeholder="상품명을 검색해주세요." value="${scri.keyword}" required>
		<button class="search-btn" id="SearchBtn" type="submit">
			<span>Search</span>
		</button>
	</form>

	<h2 class="title">인기 상품</h2>
	<div class="itemBox">
		<ul class="itemUl">
		<c:forEach items="${ls}" var="ls" varStatus="list">
			<li class="itemLi">
				<a href="/shop/view?n=${ls.itemNum}">
					<div class="itemThumb">
						<img src="${ls.itemImg}">
					</div>
					<div id="span-box">
						<span id="Kong">kong</span>
					</div>
					<div class="itemName">
						<a href="/shop/view?n=${ls.itemNum}">${ls.itemName}</a>
					</div>
					<div id="price-box">
						<span id="price"><fmt:formatNumber value="${ls.itemPrice}" pattern="###,###,###" />원</span>
					</div>
				</a>
			</li>
			<c:if test="${list.count mod 4==0}">
				<br>
			</c:if>
		</c:forEach>
		</ul>
		</div>


	<h2 class="title">전체 상품</h2>
	<ul class="itemUl">
		<c:forEach items="${list}" var="list" varStatus="List">
			<li id="itemLi">
				<a href="/shop/view?n=${list.itemNum}">
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
<%@include file="layout/footer.jsp"%>
