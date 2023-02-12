<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Kong</title>
<style type="text/css">
.pageMaker {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
}

.pageMaker li {
	float: left;
	border-radius: 5px;
}

.pageMaker>li:first-child>a {
	margin-left: 0;
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.pageMaker>li>a {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #337ab7;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #ddd;
}

.container {
	width: 70%;
	margin: auto;
}

#title {
	text-align: center;
	padding-top: 30px;
	padding-bottom: 30px;
	color: gray;
}

.tableList {
	width: 100%;
	max-width: 100%;
	margin-bottom: 20px;
	background-color: transparent;
	border-spacing: 0;
	border-collapse: collapse;
}

.tableList>tbody>tr>th {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: 1px solid #ddd;
	text-align: left;
}

.tableList>tbody>tr>td {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: 1px solid #ddd;
}

#selectSearch {
	width: 100%;
	margin-right: -15px;
	margin-left: -15px;
}

#select {
	display: inline-block;
	float: left;
	width: 16.66666667%;
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
}

.form {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgb(0 0 0/ 8%);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	font-family: inherit;
	text-transform: none;
	margin: 0;
	font: inherit;
}

.search {
	display: inline-block;
	float: left;
	width: 83.33333333%;
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
}

.input {
	position: relative;
	display: table;
	border-collapse: separate;
}

.input .keywordInput:first-child {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.input .keywordInput {
	display: table-cell;
	position: relative;
	z-index: 2;
	float: left;
	width: 100%;
	margin-bottom: 0;
}

.keywordInput {
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgb(0 0 0/ 8%);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

input {
	font-family: inherit;
	margin: 0;
	font: inherit;
}

.inputSpan {
	position: relative;
	font-size: 0;
	white-space: nowrap;
	width: 1%;
	vertical-align: middle;
	display: table-cell;
}

.inputSpan:last-child>.btn {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
	margin-left: -1px;
}

.inputSpan>.btn {
	position: relative;
}

.btn-default {
	color: #333;
	background-color: #fff;
	box-shadow: inset 0 1px 0 rgb(255 255 255/ 15%), 0 1px 1px
		rgb(0 0 0/ 8%);
	text-shadow: 0 1px 0 #fff;
	background-image: linear-gradient(to bottom, #fff 0, #e0e0e0 100%);
	background-repeat: repeat-x;
	border-color: #ccc;
}

.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	touch-action: manipulation;
	cursor: pointer;
	user-select: none;
	border: 1px solid transparent;
	border-radius: 4px;
}

#searchBtn {
	font-family: inherit;
	-webkit-appearance: button;
	text-transform: none;
	overflow: visible;
	margin: 0;
}
</style>

</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<div class="container">
		<div>
			<h2 id="title">
				<a href="/">공지사항</a>
			</h2>
		</div>
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />
		<form role="form" method="get">
			<table class="tableList">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>

				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.bno}" /></td>
						<td><a
							href="/board/readView?bno=${list.bno}
								&page=${scri.page}
								&perPageNum=${scri.perPageNum}
								&searchType=${scri.searchType}
								&keyword=${scri.keyword}">
								<c:out value="${list.title}" />
						</a></td>
						<td><c:out value="${list.writer}" /></td>
						<td><fmt:formatDate value="${list.regdate}"
								pattern="yyyy-MM-dd" /></td>
						<td><c:out value="${list.cnt}" /></td>
					</tr>
				</c:forEach>
			</table>

			<div id="selectSearch">
				<div id="select">
					<select name="searchType" class="form">
						<option value="n"
							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="w"
							<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						<option value="tc"
							<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					</select>
				</div>

				<div class="search">
					<div class="input">
						<input type="text" name="keyword" class="keywordInput"
							value="${scri.keyword}" /> <span class="inputSpan">
							<button id="searchBtn" type="submit" class="btn btn-default">검색</button>
						</span>
					</div>
				</div>

				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($(
													'#keywordInput').val());
								});
					});
				</script>
			</div>
			<div>
				<ul class="pageMaker">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
							<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</form>
		<hr />
	</div>
	<%@include file="../layout/footer.jsp"%>
</body>
</html>