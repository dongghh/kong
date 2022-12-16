<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>회원 목록</title>
<link rel="stylesheet" href="/resources/css/memberList.css">
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<div id="userBox">
			<h2 id="title">회원 목록</h2>
			<table id="userTable">
				<tr id="tr-top">
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
					<th>핸드폰 번호</th>
					<th>가입 날짜</th>
				</tr>
				<c:forEach var="member" items="${list}">
					<tr id="tr-bottom">
						<td>${member.userId}</td>
						<td>${member.userName}</td>
						<td>${member.userEmail}</td>
						<td>${member.userAddress}</td>
						<td>${member.userPnumber}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<%@include file="../layout/footer.jsp"%>