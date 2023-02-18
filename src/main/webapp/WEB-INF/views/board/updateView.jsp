<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/noticeUpdateView.css">
<title>게시판</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(
	    function() {
	        var formObj = $("form[name='updateForm']");

	        $(".cancel_btn").on(
	            "click",
	            function() {
	                event.preventDefault();
	                location.href = "/board/readView?bno=${update.bno}" +
	                    "&page=${scri.page}" +
	                    "&perPageNum=${scri.perPageNum}" +
	                    "&searchType=${scri.searchType}" +
	                    "&keyword=${scri.keyword}";
	            })

	        $(".update_btn").on("click", function() {
	            if (fn_valiChk()) {
	                return false;
	            }
	            formObj.attr("action", "/board/update");
	            formObj.attr("method", "post");
	            formObj.submit();
	        })
	    })

	function fn_valiChk() {
	    var updateForm = $("form[name='updateForm'] .chk").length;
	    for (var i = 0; i < updateForm; i++) {
	        if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
	            alert($(".chk").eq(i).attr("title"));
	            return true;
	        }
	    }
	}
</script>
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<h2 id="editTitle">공지사항</h2>
		<form name="updateForm" role="form" method="post"
			action="/board/update">
			<input type="hidden" id="writer" name="writer" value="${update.writer}" readonly="readonly" />
			<input type="hidden" name="bno" value="${update.bno}"
				readonly="readonly" />
			<table id="updateTable">
					<tr>
						<th><label for="title">제목</label></th>
						<td><input type="text" id="title" name="title" value="${update.title}" class="chk" placeholder="제목을 입력하세요" /></td>
					</tr>
					<tr>
						<th><label for="writer">작성자</label></th>
						<td><input type="text" name="writer" value="${update.writer}" readonly="readonly" /></td>
					</tr>
					<tr>
						<th><label for="regdate">작성일</label></th>
						<td><fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr id="ck">
						<td colspan="2"><textarea rows="5" cols="50" id="content"
								name="content"><c:out value="${update.content}"/></textarea> <script>
									var ckeditor_config = {
										resize_enaleb : false,
										enterMode : CKEDITOR.ENTER_BR,
										shiftEnterMode : CKEDITOR.ENTER_P,
										filebrowserUploadUrl : "/admin/item/ckUpload"
									};
									CKEDITOR
											.replace("content", ckeditor_config);
								</script></td>
					</tr>
			</table>
			<div id="editBox">
				<button type="submit" class="update_btn">저장</button>
				<button type="submit" class="cancel_btn">취소</button>
			</div>
		</form>
	</section>
	<%@include file="../layout/footer.jsp"%>