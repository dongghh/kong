<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Kong</title>
<link rel="stylesheet" href="/resources/css/memberUpdateView.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/";

		})

		$("#submit").on("click", function() {
			if ($("#userPass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			$.ajax({
				url : "/member/passChk",
				type : "POST",
				dateType : "json",
				data : $("#updateForm").serializeArray(),
				success : function(data) {

					if (data == true) {
						if (confirm("회원수정하시겠습니까?")) {
							$("#updateForm").submit();
						}

					} else {
						alert("패스워드가 틀렸습니다.");
						return;

					}
				}
			})
		});
	})
</script>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
	<p id="title">회원정보수정</p>
		<form id="updateForm" action="/member/memberUpdate" method="post">
			<ul class="info">
				<li><label class="control-label" for="userId">아이디</label></li> 
				<li><input class="form-control" type="text" id="userId" name="userId"
					value="${member.userId}" readonly="readonly" /></li>
			</ul>
			<ul class="info">
				<li><label class="control-label" for="userPass">패스워드</label></li> 
				<li><input class="form-control" type="password" id="userPass" name="userPass" /></li>
			</ul>
			<ul class="info">
				<li><label class="control-label" for="userName">성명</label></li> 
				<li><input class="form-control" type="text" id="userName" name="userName"
					value="${member.userName}" /></li>
			</ul> 
			<ul class="info">
				<li><label class="control-label" for="userEmail">이메일</label></li> 
				<li><input class="form-control" type="email" id="userEmail" name="userEmail"
					value="${member.userEmail}" /></li>
			</ul>
			<ul class="info">
				<li><label class="control-label" for="userAddress">주소</label></li>
				<li><input class="form-control" type="text" id="userAddress"
					name="userAddress" value="${member.userAddress}" /></li>
			</ul>
			<ul class="info">
				<li><label class="control-label" for="userPnumber">핸드폰번호</label></li>
				<li><input class="form-control" type="text" id="userPnumber"
					name="userPnumber" value="${member.userPnumber}" /></li>
			</ul>
		</form>
		<div id="button">
			<button class="editBtn" type="button" id="submit">회원정보수정</button>
			<button class="Btn" type="button">취소</button>
			<button class="dropBtn" type="button">회원탈퇴</button>
		</div>
	</section>
	<%@include file="../layout/footer.jsp"%>
</body>

</html>