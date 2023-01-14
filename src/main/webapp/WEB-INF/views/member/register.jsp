<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/register.css">
<script type="text/javascript" src="/resources/js/DaumPost.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".cencle").on("click", function() {
			location.href = "/";
		})

		$("#submit").on("click", function() {
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
			if ($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#userEmail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#userEmail").focus();
				return false;
			}
			if ($("#userAddress").val() == "") {
				alert("주소을 입력해주세요.");
				$("#userAddress").focus();
				return false;
			}
			if ($("#userPnumber").val() == "") {
				alert("핸드폰번호을 입력해주세요.");
				$("#userPnumber").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			}
		});
	})

	//아이디 중복검사
	function fn_idChk() {
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {
				"userId" : $("#userId").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	
	//전화번호 유효성 검사
	$(function(){
	    $("#userPnumber").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
					
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;

	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	  });  
	});
</script>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<p id="title">회원가입</p>
		<form action="/member/register" method="post" id="regForm">
			<ul class="join">
				<li class="Lli">아이디<span class="star">*</span></li>
				<li class="Rli">
					<input class="form-control" type="text" id="userId" placeholder="아이디를 입력하세요" name="userId" />
					<button class="registerBtn" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</li>
			</ul>
			<ul class="join">
				<li class="Lli">패스워드<span class="star">*</span></li>
				<li class="Rli"><input class="form-control" type="password" id="userPass"
					placeholder="비밀번호를 입력하세요" name="userPass" /></li>
			</ul>
			<ul class="join">
				<li class="Lli">이름<span class="star">*</span></li>
				<li class="Rli"><input class="form-control" type="text" id="userName"
					placeholder="이름을 입력하세요" name="userName" /></li>
			</ul>

			<ul class="join">
				<li class="Lli">이메일<span class="star">*</span></li>
				<li class="Rli">
					<input type="text" id="user_email" placeholder="이메일을 입력하세요" required> 
					<span id="middle">@</span> 
					<input type="text" id="email_address" list="user_email_address"> 
						<datalist id="user_email_address">
							<option value="naver.com"></option>
							<option value="daum.com"></option>
							<option value="google.com"></option>
							<option value="직접입력"></option>
						</datalist> 
					<input type="hidden" id="userEmail" name="userEmail" value="" />
				</li>
			</ul>

			<script>
			//이메일주소 가져오기
			$("#user_email").blur(function() {
				email();
			});

			$("#email_address").change(function() {
				email();
			});

			function email() {
				const email = $("#user_email").val();
				const middle = $("#middle").text();
				const address = $("#email_address").val();
				if (email != "" && address != "") {
					$("#userEmail").val(email + middle + address);
				}
			}
			</script>

			<ul class="join">
			<li class="Lli">주소<span class="star">*</span></li>
			<li class="Rli">
				<p>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				</p>
				<p>
					<input type="text" name="userAddr1" id="sample6_address" placeholder="주소"> 
					<input type="text" name="userAddr2" id="sample6_detailAddress" placeholder="상세주소"> 
					<input type="text" name="userAddr3" id="sample6_extraAddress" placeholder="참고항목" style="display: none;">
				</p>
				    <input type="hidden" id="userAddress" name="userAddress" value="" />
			</li>
			</ul>
			
			<script>
			//주소 가져오기
			$("#sample6_address").blur(function() {
				address();
			});
		
			$("#sample6_detailAddress").blur(function() {
				address();
			});
		
			$("#sample6_extraAddress").change(function() {
				address();
			});
		
			function address() {
				const add1 = $("#sample6_address").val();
				const add2 = $("#sample6_detailAddress").val();
				const add3 = $("#sample6_extraAddress").val();
				if (add1 != "" && add2 != "" && add3 != "") {
					$("#userAddress").val(add1 + add2 + add3);
				}
			}
			</script>
			
			<ul class="join">
				<li class="Lli">핸드폰번호<span class="star">*</span></li>
				<li class="Rli"><input class="form-control" type="text" id="userPnumber"
					placeholder="핸드폰 번호를 입력하세요" name="userPnumber" /></li>
			</ul>

		</form>
		<div>
			<button type="button" id="submit" class="registerBtn">회원가입</button>
			<button type="button" class="registerBtn">취소</button>
		</div>
	</section>
	<%@include file="../layout/footer.jsp"%>