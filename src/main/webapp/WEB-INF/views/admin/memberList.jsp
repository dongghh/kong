<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>회원 목록</title>
<style>
#container {
	height: 80%;
	width: 100%;
}

table {
	margin: auto;
	text-align: center;
	width: 90%;
}

h2 {
	text-align: center;
	margin: 20px 20px;
}
</style>
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<div id="container">
			<h2>회원 목록</h2>
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
					<th>핸드폰 번호</th>
					<th>가입 날짜</th>
				</tr>
				<c:forEach var="member" items="${list}">
					<tr>
						<td>${member.userId}</td>
						<td>${member.userName}</td>
						<td>${member.userEmail}</td>
						<td>${member.userAddress}</td>
						<td>${member.userPnumber}</td>
						<td>${member.regDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<%@include file="../layout/footer.jsp"%>