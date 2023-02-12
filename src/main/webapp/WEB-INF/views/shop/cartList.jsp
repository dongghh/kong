<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/cartList.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/DaumPost.js"></script>
<body>
	<section id="container">
	<h2 id="title">장바구니</h2>
	<input type="hidden" name="cartList" value="${cartList}" />
	<c:choose>
		<c:when test="${cartList == null}">
		<p> 장바구니가 비었습니다. </p>
		</c:when>
		<c:otherwise>
			<table id="cartTable">
				<tr id="cartTable-top">
				<th>
						<input type="checkbox" name="allCheck" id="allCheck" /><label
							for="allCheck"></label>
					<script>
					$("#allCheck").click(function() {
					var chk = $("#allCheck").prop("checked");
					if (chk) {
					$(".chBox").prop("checked", true);
					} else {
					$(".chBox").prop("checked", false);
					}
					});
					</script>
				</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>합계</th>
					<th>
						<button type="button" class="selectDelete_btn">전체 삭제</button>
						<script>
						$(".selectDelete_btn").click(
						function() {
						var confirm_val = confirm("정말 삭제하시겠습니까?");
						
						if (confirm_val) {
						var checkArr = new Array();
						
						$("input[class='chBox']:checked").each(
						function() {checkArr.push($(this).attr("data-cartNum"));});
						
						$.ajax({
						url : "/shop/deleteCart",
						type : "post",
						data : {
						chbox : checkArr},
						success : function(result) {
						if (result == 1) {
						location.href = "/shop/cartList";
						} else {
						alert("삭제 실패");
						}}});
						}});
						</script>
					</th>
				</tr>
				<c:set var="sum" value="0" />
				<c:forEach items="${cartList}" var="cartList">
					<tr id="cartTable-bottom">
						<td>
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox"
								data-cartNum="${cartList.cartNum}" />
						<script>
						$(".chBox").click(function() {
						$("#allCheck").prop("checked", false);});
						</script>
						</div>
						</td>
						<td><img src="${cartList.itemThumbImg}" /></td>
						<td class="itemName">${cartList.itemName}</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${cartList.itemPrice}" /></td>
						<td>${cartList.cartStock}<br /> </td>
						<td><fmt:formatNumber pattern="###,###,###" value="${cartList.itemPrice * cartList.cartStock}" /></td>
						<td><button type="button" id="del" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button></td>
						<script>
						$(".delete_${cartList.cartNum}_btn").click(
						function() {
						var confirm_val = confirm("정말 삭제하시겠습니까?");
						if (confirm_val) {
						var checkArr = new Array();
						
						checkArr.push($(this).attr("data-cartNum"));
						
						$.ajax({
						url : "/shop/deleteCart",
						type : "post",
						data : {
						chbox : checkArr},
						success : function(result) {
						if (result == 1) {
						location.href = "/shop/cartList";
						} else {
						alert("삭제 실패");}
						}
						});
						}
						});
						</script>
					</tr>
					<c:set var="sum"
						value="${sum + (cartList.itemPrice * cartList.cartStock)}" />
				</c:forEach>
			</table>
			<div class="listResult">
				<div class="sum">
					총 합계 :
					<fmt:formatNumber pattern="###,###,###" value="${sum}" />
					원
				</div>
				<div class="orderOpne">
					<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
				<script>
				$(".orderOpne_bnt").click(function() {
				$(".orderInfo").slideDown();
				$(".orderOpne_bnt").slideUp();});
				</script>
				</div>
			</div>
			<div class="orderInfo">

					<input type="hidden" name="amount" id="amount" value="${sum}" />

					<div class="inputArea">
						<label for="">수령인</label> <input type="text" name="orderRec"
							id="orderRec" required="required" />
					</div>

					<div class="inputArea">
						<label for="orderPhon">수령인 연락처</label> <input type="text"
							name="orderPhon" id="orderPhon" required="required" />
					</div>

					<div class="inputArea">
						<p>
							<input type="text" id="sample6_postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						</p>
						<p>
							<input type="text" class="userAddr1" name="userAddr1" id="sample6_address" placeholder="주소"> 
							<input type="text" class="userAddr2"  name="userAddr2" id="sample6_detailAddress" placeholder="상세주소"> 
							<input type="text" class="userAddr3"  name="userAddr3" id="sample6_extraAddress" placeholder="참고항목">
						</p>
						<span style="color : red">* 결제시 QR코드 스캔 후 웹 화면에  결제 완료가 나타나면 모바일로 결제해주세요.</span>
						<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
								id="btnCloseLayer"
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
					</div>


					<div class="inputArea">
						<button type="button" class="order_btn" onclick="requestPay()">주문</button>
						<script>
						function requestPay() {
						  let total = $('.sum').text();
						  IMP.init('imp40616528'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
						  IMP.request_pay({
						    pg: "kakaopay",
						    merchant_uid : 'merchant_'+new Date().getTime(),
						    name : 'Kong 결제',
						    amount : total,
						    buyer_email : '',
						    buyer_name : '',
						    buyer_tel : '', 
						    buyer_addr : '',
						    buyer_postcode : ''
						  }, function (rsp) { // callback
						      if (rsp.success) {
						    	  var msg = '결제가 완료되었습니다.';
						          alert(msg);
						          $.ajax({
						        	  url : "/shop/cartList",
						        	  type : "POST",
						        	  data : {
						        		  amount : $("#amount").val(),
						        		  orderRec : $("#orderRec").val(),
						        		  orderPhon : $("#orderPhon").val(),
						        		  userAddr1 : $(".userAddr1").val(),
						        		  userAddr2 : $(".userAddr2").val(),
						        		  userAddr3 : $(".userAddr3").val()
						        	  },success : function(result){
						        		  console.log(result);
						        		  location.href = "/shop/orderList";
						        	  },
						        	  error : function(error){
						        		  console.log(error)
						        	  }
						          })
						      } else {
						    	  var msg = '결제에 실패하였습니다.';
						          msg += '에러내용 : ' + rsp.error_msg;
						          alert(msg);
						      }
						  });
						}
						</script>
						<script>
							//전화번호 유효성 검사
							$(function(){
								$("#orderPhon").on('keydown', function(e){
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
						<button type="button" class="cancel_btn">취소</button>
						<script>
						$(".cancel_btn").click(function() {
						$(".orderInfo").slideUp();
						$(".orderOpne_bnt").slideDown();});
						</script>
					</div>
			</div>
			</c:otherwise>
			</c:choose>
	</section>
<%@include file="../layout/footer.jsp"%>