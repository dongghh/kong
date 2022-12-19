<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/noticeReadView.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
			<h1 id="noticeTitle">공지사항</h1>

		<section id="">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> 
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			</form>

			<!-- table edit area -->
			<table id="table">
				<tr>
					<th><label for="title">제목</label></th>
					<td><input type="text" name="title" class="form-control" value="${read.title}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th><label for="writer">작성자</label>
					</th>
					<td><input type="text" name="writer" value="${read.writer}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th><label for="regdate">작성일</label>
					</th>
					<td><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr id="table-content">
					<td colspan="2">
						<textarea name="content" id="text" readonly="readonly">
						<c:out value="${read.content}"/>
						</textarea>
					</td>
				</tr>
			</table>
			<!-- table edit area -->
			<c:if test="${member.userId == read.writer || member.verify == 9}">
				<div id="editBox">
					<button type="button" class="update_btn">수정</button>
					<button type="button" class="delete_btn">삭제</button>
				</div>
			</c:if>
			<hr style="width : 100%;">

			<!-- 댓글 -->
			<form name="replyForm" method="post" class="form-horizontal">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> 
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			<c:if test="${member != null }">
			<div id="reply-box">
				<input type="hidden" id="writer" name="writer" value="${member.userId }" readonly />
				<div class="reply-content">
					<textarea placeholder="댓글을 입력해주세요." id="content" name="content"></textarea>
				</div>
				<div id="reply-button">
					<button class="reply-save-button" type="button">댓글 작성</button>
				</div>
			</div>
			</c:if>
			<c:if test="${member == null }">
			<div class="reply-content">
			<textarea placeholder="로그인 후 작성할 수 있습니다." id="content2" readonly="readonly"></textarea>
			</div>
			</c:if>
			</form>
			<!-- 댓글 출력  -->
			<div id="reply">
				<ol class="replyList">
					<c:forEach items="${replyList}" var="replyList">
						<div id="reply1">
							<div style="display:inline-block">
								${replyList.writer}
							</div>
							<div style="display:inline-block">
								<fmt:formatDate value="${replyList.regdate}"
								pattern="yyyy년MM월dd일" />
							</div>
							<div style="margin : 10 0 10 0"><p>${replyList.content}</p></div>
							<c:if test="${member.userId == replyList.writer || member.verify == 9}">
								<div id="reply-button">
									<button type="button" class="replyUpdateBtn"
										data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn"
										data-rno="${replyList.rno}">삭제</button>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</ol>
			</div>
<script>
$(document).ready(function() {
var formObj = $("form[name='readForm']");

// 작성
$(".reply-save-button").on("click", function() {
	formObj.attr("action", "/replyWrite");
	formObj.submit();
})

// 수정 
$(".update_btn").on("click", function() {
formObj.attr("action", "/board/updateView");
formObj.attr("method", "get");
formObj.submit();
})

// 삭제
$(".delete_btn").on("click", function() {

var deleteYN = confirm("삭제하시겠습니까?");
if (deleteYN == true) {

formObj.attr("action", "/board/delete");
formObj.attr("method", "post");
formObj.submit();}
})

// 목록
$(".list_btn").on("click",function() {

location.href = "/board/list?page=${scri.page}"
+ "&perPageNum=${scri.perPageNum}"
+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";})

$(".replyWriteBtn").on("click", function() {
var formObj = $("form[name='replyForm']");
formObj.attr("action", "/board/replyWrite");
formObj.submit();});

//댓글 수정 View
$(".replyUpdateBtn").on("click",function() {
location.href = "/board/replyUpdateView?bno=${read.bno}"
+ "&page=${scri.page}"
+ "&perPageNum=${scri.perPageNum}"
+ "&searchType=${scri.searchType}"
+ "&keyword=${scri.keyword}"
+ "&rno="
+ $(this).attr("data-rno");
});


//댓글 삭제 View
$(".replyDeleteBtn").on("click",function() {
	var replyDelete = confirm("삭제하시겠습니까?");
	if (replyDelete == true) {
location.href = "/board/replyDelete?bno=${read.bno}"
+ "&page=${scri.page}"
+ "&perPageNum=${scri.perPageNum}"
+ "&searchType=${scri.searchType}"
+ "&keyword=${scri.keyword}"
+ "&rno="
+ $(this).attr("data-rno");}
});})
</script>
<script>
$(document).ready(function() {
var formObj = $("form[name='replyForm']");

// 작성
$(".reply-save-button").on("click", function() {
formObj.attr("action", "replyWrite");
formObj.submit();
});})
</script>
</section>
</section>
<%@include file="../layout/footer.jsp"%>