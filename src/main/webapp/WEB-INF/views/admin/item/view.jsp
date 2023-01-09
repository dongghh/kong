<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
<style>
#section {
	width: 60%;
	margin: auto;
}

.oriImg {
	width: 600px;
	height: 500px;
}

.thumbImg {
	width: 500px;
	height: 500px;
}

.itemDes Img {
	max-width: 600px;
	height: auto;
}

#itemBox2 {
	width: 100%;
	height: 60%;
}

#Box {
	width: 100%;
	height : 450px;
}

table td {
	text-align: center;
}

#itemInfo {
	float: right;
	width: 50%;
	font-size: 20px;
	height: 100%;
}

.itemImg {
	float: left;
	height: 100%;
	width: 50%
}

.itemImg img {
	height: 400px;
	width: 400px;
	float: left;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<div id="section">
		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="n" value="${item.itemNum}" />
			<div id="Box">
				<div class="itemImg">
					<img src="${item.itemImg}" class="oriImg" />
				</div>
				<table id="itemInfo">
					<tr>
						<th>분류 코드</th>
						<td>${item.cateCode}</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${item.itemName}</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><fmt:formatNumber value="${item.itemPrice}"
								pattern="###,###,###" /></td>
					</tr>
					<tr>
						<th>상품수량</th>
						<td>${item.itemStock}</td>
					</tr>
					<tr>
						<th>상품소개</th>
						<td class="itemDes">${item.itemDes}</td>
					</tr>
					<tr>
						<th colspan="2">
							<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
							<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
							<script>
								var formObj = $("form[role='form']");

								$("#modify_Btn").click(
										function() {
											formObj.attr("action",
													"/admin/item/modify");
											formObj.attr("method", "get")
											formObj.submit();
										});

								$("#delete_Btn").click(
										function() {

											var con = confirm("정말로 삭제하시겠습니까?");

											if (con) {
												formObj.attr("action",
														"/admin/item/delete");
												formObj.submit();
											}
										});
							</script>
						</th>
				</table>
			</div>
		</form>
	</div>
	<%@include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>