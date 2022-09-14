<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
#container {
	height: 80%;
	width: 100%;
}
</style>
<script src="/resources/js/summernote-ko-KR.js"></script>
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

	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});
</script>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<div id="root">
			<hr />

			<div>
				<%@include file="nav.jsp"%>
			</div>
			<hr />

			<section id="container">
				<form name="writeForm" method="post" action="/board/write">
					<table>
						<tbody>
							<c:if test="${member.userId != null}">
								<tr>
									<td><label for="title">제목</label><input type="text"
										id="title" name="title" class="chk" title="제목을 입력하세요." /></td>
								</tr>
								<tr>
									<td><label for="content">내용</label> <textarea id="content"
											name="content" class="chk" title="내용을 입력하세요."></textarea></td>
								</tr>
								<tr>
									<td><label for="writer">작성자</label><input type="text"
										id="writer" name="writer" class="chk" title="작성자를 입력하세요."
										value="${member.userId}" readonly /></td>
								<tr>
									<td>
										<button class="write_btn" type="submit">작성</button>
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
		</div>
	</section>
	<%@include file="../layout/footer.jsp"%>
</body>
</html>