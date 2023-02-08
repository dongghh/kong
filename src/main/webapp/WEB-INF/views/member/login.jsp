<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/login.css">

<%@ include file="../layout/header.jsp"%>
<!--section-->
<section class="section">
   <div id="container">
      <div id="wrap-content">
         <h2>로그인</h2>
         <br>
         <div id="input">
            <form action="/member/login" method="POST" name="homeForm">
               <input type="text" placeholder="아이디" id="userId" name="userId"
                  style="border-radius: 5px 5px 0px 0px;"> 
                  <input type="password" placeholder="비밀번호" id="userPass" name="userPass"
                  style="border-radius: 0px 0px 5px 5px;">
               <button type="submit" id="login-btn">로그인</button>
               
               <c:if test="${msg == false}">
  					<p style="color:#f00;">로그인에 실패했습니다.</p>
 				</c:if>
 				<c:if test="${id == false}">
  					<p style="color:#f00;">아이디가 존재하지 않습니다.</p>
 				</c:if>
               <script>
				$("#login-btn").on("click", function() {
					if ($("#userId").val() == "") {
						alert("아이디를 입력해주세요.");
						$("#userId").focus();
						return false;
					}
					if ($("#userPass").val() == "") {
						alert("비밀번호를 입력해주세요.");
						$("#userPass").focus();
						return false;
					}
				});
				</script>
            </form>
         </div>

         <div id="sub_btn">
            <div>
               <a href="/member/findId">아이디</a>/<a href="/member/findPw">비밀번호 찾기</a>
            </div>
            <div>
               <a href="/member/register">회원가입</a>
            </div>

         </div>
      </div>
   </div>
</section>

<%@ include file="../layout/footer.jsp"%>