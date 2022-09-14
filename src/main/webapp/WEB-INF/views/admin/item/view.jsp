<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
<style>
#section {
	height: 80%;
	width: 80%;
	background-color: #E8F5FF;
	margin: auto;
}

.oriImg {
	width: 600px;
	height: 500px;
}

.inputArea {
	margin: 20px 20px;
}

.itemDes Img {
	max-width: 600px;
	height: auto;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<section id="container">
		<div id="section">
			<form role="form" method="post" autocomplete="off">

				<input type="hidden" name="n" value="${item.itemNum}" />

				<div class="inputArea">
					<label>1차 분류</label> <span class="category1"></span> <label>2차
						분류</label> <span class="category2">${item.cateCode}</span>
				</div>

				<div class="inputArea">
					<label for="itemName">상품명</label> <span>${item.itemName}</span>
				</div>

				<div class="inputArea">
					<label for="itemPrice">상품가격</label> <span><fmt:formatNumber
							value="${item.itemPrice}" pattern="###,###,###" /></span>
				</div>

				<div class="inputArea">
					<label for="itemStock">상품수량</label> <span>${item.itemStock}</span>
				</div>

				<div class="inputArea">
					<label for="itemDes">상품소개</label>
					<div class="itemDes">${item.itemDes}</div>
				</div>

				<div class="inputArea">
					<label for="gdsImg">이미지</label>
					<p>원본 이미지</p>
					<img src="${item.itemImg}" class="oriImg" />

					<p>썸네일</p>
					<img src="${item.itemThumbImg}" class="thumbImg" />
				</div>

				<div class="inputArea">
					<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
					<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>

					<script>
						var formObj = $("form[role='form']");

						$("#modify_Btn").click(function() {
							formObj.attr("action", "/admin/item/modify");
							formObj.attr("method", "get")
							formObj.submit();
						});

						$("#delete_Btn").click(function() {

							var con = confirm("정말로 삭제하시겠습니까?");

							if (con) {
								formObj.attr("action", "/admin/item/delete");
								formObj.submit();
							}
						});
					</script>
				</div>
			</form>
		</div>
	</section>
	<%@include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>