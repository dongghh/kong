<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/main.css">
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

	<table class="new">
		<caption>
			<h3>NEW PRODUCT</h3>
		</caption>
		<tr>
			<td><img src="/images/none.png" alt="신제품1"></td>
			<td><img src="/images/none.png" alt="신제품2"></td>
			<td><img src="/images/none.png" alt="신제품3"></td>
			<td><img src="/images/none.png" alt="신제품4"></td>
			<td><img src="/images/none.png" alt="신제품5"></td>
		</tr>
		<tr>
			<td id="price">[선택]상품명<br>10,000원<br>
				<p id="review_txt">리뷰 : 0</p>
			</td>
			<td id="price">[선택]상품명<br>10,000원<br>
				<p id="review_txt">리뷰 : 0</p>
			</td>
			<td id="price">[선택]상품명<br>10,000원<br>
				<p id="review_txt">리뷰 : 0</p>
			</td>
			<td id="price">[선택]상품명<br>10,000원<br>
				<p id="review_txt">리뷰 : 0</p>
			</td>
			<td id="price">[선택]상품명<br>10,000원<br>
				<p id="review_txt">리뷰 : 0</p>
			</td>
		</tr>
	</table>
	<table class="banner">
		<tr>
			<td><img src="/images/none.png" alt="중간1"></td>
			<td><img src="/images/none.png" alt="중간2"></td>
		</tr>
	</table>


	<div class="best-wrap">
		<h2>BEST</h2>
		<div id="best-box">
			<div class="best-left">
				<div class="slide">
					<img src="/images/none.png" alt="">
					<p style="margin-top : 40px; ">[선택] 상품명</p>
					<b>10,000<span>원</span></b>
				</div>
			</div>
			<div class="best-right">
				<div class="best-box2">
					<div class="best-img">
						<img src="/images/none.png" alt="">
					</div>
					<p>[선택] 상품명</p>
					<b>10,000<span>원</span></b>
				</div>
				<div class="best-box2">
					<div class="best-img">
						<img src="/images/none.png" alt="">
					</div>
					<p>[선택] 상품명</p>
					<b>10,000<span>원</span></b>
				</div>
				<div class="best-box2">
					<div class="best-img">
						<img src="/images/none.png" alt="">
					</div>
					<p>[선택] 상품명</p>
					<b>10,000<span>원</span></b>
				</div>
				<div class="best-box2">
					<div class="best-img">
						<img src="/images/none.png" alt="">
					</div>
					<p>[선택] 상품명</p>
					<b>10,000 <span>원</span></b>
				</div>
			</div>
		</div>
	</div>
	<table class="all">
		<caption>
			<h3>전체 상품</h3>
		</caption>
		<c:forEach items="${list}" var="list"> 
		<tr>
			<td><img src="${list.itemThumbImg}" alt="전체1"></td>
		</tr>
		<tr>
			<td id="price">[선택]상품명<br>10,000원<br>
				<p id="review_txt">리뷰 : 0</p>
			</td>
		</tr>
		</c:forEach>
	</table>
</section>
<%@include file="layout/footer.jsp"%>
