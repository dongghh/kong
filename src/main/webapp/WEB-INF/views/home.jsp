<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/home.css">
<title>메인</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<br />
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})
		$("#registerBtn").on("click", function() {
			location.href = "member/register";
		})
		$("#memberUpdateBtn").on("click", function() {
			location.href = "member/memberUpdateView";
		})
		$("#memberDeleteBtn").on("click", function() {
			location.href = "member/memberDeleteView";
		})
		$("#memberListBtn").on("click", function() {
			location.href = "admin/memberList";
		})
		$("#boardListBtn").on("click", function() {
			location.href = "board/list";
		})
		$("#itemRegisterBtn").on("click", function() {
			location.href = "admin/item/register";
		})
		$("#itemListBtn").on("click", function() {
			location.href = "admin/item/list";
		})
		$("#orderListBtn").on("click", function() {
			location.href = "admin/shop/orderList";
		})
		$("#allReplyBtn").on("click", function() {
			location.href = "admin/shop/allReply";
		})

	})
</script>
<body>
	<%@include file="layout/header.jsp"%>
	<div id="section">
		<form name='homeForm' method="post" action="/member/login">
			<c:if test="${member == null}">
				<div id="login">
					<div>
						<label for="userId"></label> <input type="text" id="userId"
							name="userId">
					</div>
					<div>
						<label for="userPass"></label> <input type="password"
							id="userPass" name="userPass">
					</div>
					<div>
						<button type="submit">로그인</button>
						<button id="registerBtn" type="button">회원가입</button>
					</div>
				</div>
			</c:if>

			<c:if test="${member != null }">

				<c:if test="${member.verify == 0 }">
					<div>
						<p>${member.userId}님환영합니다.</p>
						<button id="boardListBtn" type="button">게시판</button>
						<button id="memberUpdateBtn" type="button">회원정보수정</button>
						<button id="logoutBtn" type="button">로그아웃</button>
						<button id="memberDeleteBtn" type="button">회원탈퇴</button>
					</div>
				</c:if>

				<c:if test="${member.verify == 9 }">
					<div>
						<p>${member.userId}님환영합니다.</p>
						<button id="boardListBtn" type="button">게시판</button>
						<button id="memberUpdateBtn" type="button">회원정보수정</button>
						<button id="logoutBtn" type="button">로그아웃</button>
						<button id="memberListBtn" type="button">회원목록</button>
					</div>
					<div>
						<button id="itemRegisterBtn" type="button">상품 등록</button>
						<button id="itemListBtn" type="button">상품 목록</button>
						<button id="orderListBtn" type="button">주문 목록</button>
						<button id="allReplyBtn" type="button">상품 소감</button>
					</div>
				</c:if>

			</c:if>

			<c:if test="${msg == false}">
				<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			</c:if>
		</form>
	</div>
	<%@include file="layout/footer.jsp"%>
</body>
</html>
