<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/login.css">
<head>
<style>
section {
	width: 70%;
	margin: auto;
}

#div1 {
	margin: 30px 0px 30px;
}

#div1 input {
	border: 1px solid lightgray;
}

form>div>input {
	margin-right: 100px;
	margin-left: 10px;
}

button {
	display: block;
	margin: 30px auto;
	padding: 10px 20px;
	background-color: black;
	color: white;
}

#id {
	margin-bottom: 70px;
}

#container {
	width: 100%;
	margin: 30px auto;
	text-align: left;
}

h3 {
	text-align: start;
}

.id_pw_hr {
	border: 1px solid lightgray;
}

.article {
	padding: 30px 0px;
}
</style>
</head>
<%@ include file="../layout/header.jsp"%>
<body>
	<section>
		<h1>아이디/비밀번호 찿기</h1>
		<div id="container">

			<div id="id">
				<h3>아이디 찾기</h3>
				<form name="findId" action="/member/findIdPw" method="POST" name="findId">
					<hr class="id_pw_hr">
					<div class="article">
						<small>회원가입 시, 입력하신 이름 + 이메일로 아이디를 확인하실 수 있습니다.</small> <br>
						<br>
						<div id="findID">
							이름 <input type="text" id="userName" name="userName" required /> 
							&nbsp;&nbsp; 
							이메일 <input type="email" id="userEmail" name="userEmail" required />
						</div>
					</div>
					<hr class="id_pw_hr">
					<input type="submit" class="find" value="아이디 찾기" />
				</form>
			</div>

			<!-- 이름과 전화번호가 일치하지 않을 때-->
			<c:if test="${check == 1}">
				<script>
					opener.document.findId.userName.value = "";
					opener.document.findId.userEmail.value = "";
				</script>
				<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>

			<!-- 이름과 비밀번호가 일치 -->
			<c:if test="${check == 0 }">
				<label>찾으시는 아이디는 '${id}' 입니다.</label>
				<div class="form-label-group">
					<input type="button" value="OK" onclick="closethewindow()">
				</div>
			</c:if>
			<script>
				function closethewindow() {
					self.close();}
			</script>

			<div id="pw">
				<h3>비밀번호 찾기</h3>
				<hr class="id_pw_hr">
				<form>
					<div class="article">
						<small>가입하신 아이디 + 이메일 또는 휴대폰 번호를 입력, 비밀번호를 변경하시기 바랍니다.</small> <br>
						<br>
						<div id="findPW">
							아이디 <input type="text" id="Nid"> &nbsp;&nbsp; 이메일 <input
								type="email" id="Nemail">
						</div>
					</div>
					<hr class="id_pw_hr">
					<input type="submit" class="find" value="비밀번호 찾기" />
				</form>

			</div>
		</div>
	</section>
</body>
<%@ include file="../layout/footer.jsp"%>