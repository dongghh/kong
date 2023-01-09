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
            </form>
         </div>

         <div id="sub_btn">
            <div>
               <a href="/member/">아이디/비밀번호 찾기</a>
            </div>
            <div>
               <a href="/member/register">회원가입</a>
            </div>

         </div>
      </div>
   </div>
</section>

<%@ include file="../layout/footer.jsp"%>