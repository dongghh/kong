<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/writeView.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
	<%@include file="../layout/header.jsp"%>
			<section id="container">
			<h2 id="writeTitle">공지사항</h2>
				<form name="writeForm" method="post" action="/board/write">
					<table id="writeTable">
						<tbody>
							<c:if test="${member.userId != null}">
							<input type="hidden" value="${member.userId }" id="writer" name="writer">
								<tr>
									<th><label for="title">제목</label></th>
									<td><input type="text" id="title" name="title" class="chk" placeholder="제목을 입력하세요." /></td>
								</tr>
								<tr id="ck">
									<td colspan="2"><textarea rows="5" cols="50" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
									<script>
										var ckeditor_config = {
											resize_enaleb : false,
											enterMode : CKEDITOR.ENTER_BR,
											shiftEnterMode : CKEDITOR.ENTER_P,
											filebrowserUploadUrl : "/admin/item/ckUpload"};
										    CKEDITOR.replace("content", ckeditor_config);
										</script></td>   			
								</tr>
								<tr>
									<td id="botton" colspan="2">
										<button type="button" class="btn" onclick="location.href='/board/list'">목록</button>
										<button type="submit" class="write_btn">작성</button>
									</td>
								</tr>
							</c:if>
							<c:if test="${member.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>

						</tbody>
					</table>
				</form>
			</section>
	<%@include file="../layout/footer.jsp"%>
</body>
</html>