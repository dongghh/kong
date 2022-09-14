<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<style>
#section {
	height: 80%;
	width: 80%;
	background-color: #E8F5FF;
	margin: auto;
}

.select_img img {
	margin: 20px 0;
}

.ck-editor__editable {
	min-height: 400px;
}

.inputArea {
	margin: 20px 20px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/layout/header.jsp"%>
	<section id="container">
		<div id="section">
			<form role="form" method="post" autocomplete="off"
				enctype="multipart/form-data">

				<div class="inputArea">
					<label>1차 분류</label> <select class="category1">
						<option value="">전체</option>
					</select> <label>2차 분류</label> <select class="category2" name="cateCode">
						<option value="">전체</option>
					</select>
				</div>

				<div class="inputArea">
					<label for="itemName">상품명</label> <input type="text" id="itemName"
						name="itemName" />
				</div>

				<div class="inputArea">
					<label for="itemPrice">상품가격</label> <input type="text"
						id="itemPrice" name="itemPrice" />
				</div>

				<div class="inputArea">
					<label for="itemStock">상품수량</label> <input type="text"
						id="itemStock" name="itemStock" />
				</div>
				<div class="inputArae">
					<label for="itemDes"></label>
					<textarea rows="5" cols="50" id="itemDes" name="itemDes"></textarea>

					<script>
						var ckeditor_config = {
							resize_enaleb : false,
							enterMode : CKEDITOR.ENTER_BR,
							shiftEnterMode : CKEDITOR.ENTER_P,
							filebrowserUploadUrl : "/admin/item/ckUpload"
						};
						CKEDITOR.replace("itemDes", ckeditor_config);
					</script>
				</div>

				<div class="inputArea">
					<label for="itemImg">이미지</label> <input type="file" id="itemImg"
						name="file" />
					<div class="select_img">
						<img src="" />
					</div>

					<script>
						$("#itemImg").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
					<%=request.getRealPath("/")%>
				</div>


				<div class="inputArea">
					<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
				</div>

			</form>
		</div>
		<script>
			// 컨트롤러에서 데이터 받기
			var jsonData = JSON.parse('${category}');
			console.log(jsonData);

			var cate1Arr = new Array();
			var cate1Obj = new Object();

			// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
			for (var i = 0; i < jsonData.length; i++) {

				if (jsonData[i].level == "1") {
					cate1Obj = new Object(); //초기화
					cate1Obj.cateCode = jsonData[i].cateCode;
					cate1Obj.cateName = jsonData[i].cateName;
					cate1Arr.push(cate1Obj);
				}
			}

			// 1차 분류 셀렉트 박스에 데이터 삽입
			var cate1Select = $("select.category1")

			for (var i = 0; i < cate1Arr.length; i++) {
				cate1Select
						.append("<option value='" + cate1Arr[i].cateCode + "'>"
								+ cate1Arr[i].cateName + "</option>");
			}

			$(document)
					.on(
							"change",
							"select.category1",
							function() {

								var cate2Arr = new Array();
								var cate2Obj = new Object();

								// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
								for (var i = 0; i < jsonData.length; i++) {

									if (jsonData[i].level == "2") {
										cate2Obj = new Object(); //초기화
										cate2Obj.cateCode = jsonData[i].cateCode;
										cate2Obj.cateName = jsonData[i].cateName;
										cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

										cate2Arr.push(cate2Obj);
									}
								}

								var cate2Select = $("select.category2");

								cate2Select.children().remove();

								$("option:selected", this)
										.each(
												function() {

													var selectVal = $(this)
															.val();
													cate2Select
															.append("<option value='" + selectVal + "'>전체</option>");

													for (var i = 0; i < cate2Arr.length; i++) {
														if (selectVal == cate2Arr[i].cateCodeRef) {
															cate2Select
																	.append("<option value='" + cate2Arr[i].cateCode + "'>"
																			+ cate2Arr[i].cateName
																			+ "</option>");
														}
													}

												});

							});
		</script>
		<script>
			var regExp = /[^0-9]/gi;

			$("#itemPrice").keyup(function() {
				numCheck($(this));
			});
			$("#itemStock").keyup(function() {
				numCheck($(this));
			});

			function numCheck(selector) {
				var tempVal = selector.val();
				selector.val(tempVal.replace(regExp, ""));
			}
		</script>
	</section>
	<%@include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>