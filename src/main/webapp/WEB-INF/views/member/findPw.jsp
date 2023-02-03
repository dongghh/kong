<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

			<div id="pw">
				<h3>비밀번호 찾기</h3>
				<hr class="id_pw_hr">
				<form name="findPw" action="/member/findPw" method="POST">
					<div class="article">
						<small>가입하신 정보로 비밀번호를 변경하시기 바랍니다.</small> <br> <br>
						<div id="findPW">
							아이디 <input type="text" id="userId" name="userId" required> &nbsp;&nbsp; 
							이름 <input type="text" id="userName" name="userName" required /> &nbsp;&nbsp; 
							이메일 <input type="email" id="userEmail" name="userEmail" required />
						</div>
					</div>
					<hr class="id_pw_hr">
					<input type="submit" class="find" value="비밀번호 찾기" />
					
					<!-- 정보가 일치하지 않을 때-->
					<c:if test="${check == 1}">
						<script>
							alert("일치하는 정보가 존재하지 않습니다.")
						</script>
					</c:if>

					<!-- 이름과 비밀번호가 일치하지 않을 때 -->
					<c:if test="${check == 0 }">
						<div>
							<label>비밀번호를 변경해주세요.</label>
						</div>
						<div class="">
							<input type="hidden" id="id" name="updateid" value="${updateid }">

							<input type="password" id="password" name="pwd" class="form-control" /> 
								<label for="password">password</label>
						</div>

						<div class="form-label-group">
							<input type="password" id="confirmpassword" name="confirmpwd" class="form-control" /> 
								<label for="confirmpassword">confirm password</label>
						</div>

						<div class="form-label-group">
							<input type="button" value="update password" onclick="updatePassword()">
						</div>
					</c:if>
				</form>
				
				<script type="text/javascript">
				function updatePassword(){
					if(document.findPw.pwd.value==""){
						alert("비밀번호를 입력해주세요.");
						document.findform.pwd.focus();
					} else if(document.findPw.pwd.value != document.findform.confirmpwd.value){
						alert("비밀번호가 일치하지 않습니다.");
						document.findPw.confirmpwd.focus();
					} else {
						document.findPw.action="update_password";
						document.findPw.submit();
					}
				}
				</script>

			</div>
		</div>
	</section>
</body>
<%@ include file="../layout/footer.jsp"%>