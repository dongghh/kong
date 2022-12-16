<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
li {
	list-style: none;
	display: inline;
	padding: 6px;
}

p {
	display: inline;
}
</style>
<ul>
	<li><a href="/board/list">목록</a></li>
	<li><a href="/board/writeView">글 작성</a></li>
	<li><c:if test="${member != null}">
			<p>${member.userId}님안녕하세요.</p>
		</c:if></li>
</ul>