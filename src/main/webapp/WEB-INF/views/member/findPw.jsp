<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/login.css">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/member/findPw",
				type : "POST",
				data : {
					userId : $("#userId").val(),
					userEmail : $("#userEmail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
</head>
<%@ include file="../layout/header.jsp"%>
<body>
	<section>
		<h1>아이디/비밀번호 찿기</h1>
		<div id="container">

			<div id="pw">
				<h3>비밀번호 찾기</h3>
				<hr class="id_pw_hr">
					<div class="article">
						<small>가입하신 정보로 비밀번호를 변경하시기 바랍니다.</small> <br> <br>
						<div id="findPw">
							아이디 <input type="text" id="userId" name="userId" required> &nbsp;&nbsp;  
							이메일 <input type="email" id="userEmail" name="userEmail" required />
						</div>
					</div>
					<hr class="id_pw_hr">
					<div class="buttonBox">
						<button type="button" class="find" id="findBtn">비밀번호 찾기</button>
					</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="../layout/footer.jsp"%>