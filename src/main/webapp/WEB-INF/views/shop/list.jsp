<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@include file="../layout/header.jsp"%>
<style>
#container {
	width: 70%;
	margin: auto;
}

.itemBox {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

@media ( min-width : 576px) {
	.itemBox {
		max-width: 540px;
	}
}

@media ( min-width : 768px) {
	.itemBox {
		max-width: 720px;
	}
}

@media ( min-width : 992px) {
	.itemBox {
		max-width: 960px;
	}
}

@media ( min-width : 1200px) {
	.itemBox {
		max-width: 1140px;
	}
}

@media only screen and (min-width: 1200px) {
	.itemBox {
		max-width: 1170px;
	}
}

.itemUl {
	/* margin: auto;
	width: 100%;
	text-align: center; */
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}

.itemUl li {
	position: relative;
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	list-style: none;
	margin-bottom: 30px;
}

@media ( min-width : 576px) {
	.itemUl li {
		flex: 0 0 50%;
		max-width: 50%;
	}
}

@media ( min-width : 768px) {
	.itemUl li {
		flex: 0 0 33.333333%;
		max-width: 33.333333%;
	}
}

@media ( min-width : 992px) {
	.itemUl li {
		flex: 0 0 25%;
		max-width: 25%;
	}
}

.itemThumb {
	width: 200px;
	height: 230px;
}

.itemThumb img {
	width: 200px;
	height: 200px;
	border-radius: 15px 15px;
}

.itemName {
	padding: 20px 0 10px 0;
	text-align: left;
}

.itemName a {
	color: #000;
	font-size: larger;
}

#Kong {
	font-size: small;
	float: left;
}

#span-box {
	margin-bottom: 10px;
}

#price {
	float: left;
}
</style>
<section id="container">
	<div class="itemBox">
		<ul class="itemUl">
			<c:forEach items="${list}" var="list" varStatus="ls">
				<li>
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
				</li>
				<c:if test="${ls.count mod 4==0}">
					<br>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</section>
<%@include file="../layout/footer.jsp"%>