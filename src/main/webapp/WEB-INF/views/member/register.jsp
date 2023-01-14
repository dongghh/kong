<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="/resources/css/register.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
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
	
	
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=add1]").val(data.zonecode);
				$("[name=add2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<p id="title">회원가입</p>
		<form action="/member/register" method="post" id="regForm">
			<ul class="join">
				<li>아이디<span class="star">*</span></li>
				<li><input class="form-control" type="text" id="userId" placeholder="아이디를 입력하세요" name="userId" /></li>
				<button class="registerBtn" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			</ul>
			<ul class="join">
				<li>패스워드<span class="star">*</span></li>
				<li><input class="form-control" type="password" id="userPass"
					placeholder="비밀번호를 입력하세요" name="userPass" /></li>
			</ul>
			<ul class="join">
				<li>이름<span class="star">*</span></li>
				<li><input class="form-control" type="text" id="userName"
					placeholder="이름을 입력하세요" name="userName" /></li>
			</ul>

			<ul class="join">
				<li>이메일<span class="star">*</span></li>
				<li><input type="text" id="user_email" placeholder="이메일을 입력하세요" required> 
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
				<li>주소<span class="star">*</span></li>
				<li><input placeholder="우편번호" id="userAddress"
					name="userAddress"></li>
			</ul>
			<ul class="join">
				<li>핸드폰번호<span class="star">*</span></li>
				<li><input class="form-control" type="text" id="userPnumber"
					placeholder="핸드폰 번호를 입력하세요" name="userPnumber" /></li>
			</ul>

		</form>
		<div>
			<button type="button" id="submit" class="registerBtn">회원가입</button>
			<button type="button" class="registerBtn">취소</button>
		</div>
	</section>
	<%@include file="../layout/footer.jsp"%>