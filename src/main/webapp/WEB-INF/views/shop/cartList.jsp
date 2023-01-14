<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/cartList.css">
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
					<th>선택
						<button type="button" class="selectDelete_btn">삭제</button>
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
						<td>${cartList.itemName}</td>
						<td><fmt:formatNumber pattern="###,###,###" value="${cartList.itemPrice}" /></td>
						<td>${cartList.cartStock}<br /> </td>
						<td><fmt:formatNumber pattern="###,###,###" value="${cartList.itemPrice * cartList.cartStock}" /></td>
						<td><button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button></td>
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
				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="amount" value="${sum}" />

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
							<input type="text" name="userAddr1" id="sample6_address" placeholder="주소"> 
							<input type="text" name="userAddr2" id="sample6_detailAddress" placeholder="상세주소"> 
							<input type="text" name="userAddr3" id="sample6_extraAddress" placeholder="참고항목">
						</p>
						<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
								id="btnCloseLayer"
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					</div>


					<div class="inputArea">
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="cancel_btn">취소</button>
						<script>
						$(".cancel_btn").click(function() {
						$(".orderInfo").slideUp();
						$(".orderOpne_bnt").slideDown();});
						</script>
					</div>
				</form>
			</div>
			</c:otherwise>
			</c:choose>
	</section>
<%@include file="../layout/footer.jsp"%>