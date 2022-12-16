$(document).ready(function() {
var formObj = $("form[name='readForm']");

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
location.href = "/board/replyDeleteView?bno=${read.bno}"
+ "&page=${scri.page}"
+ "&perPageNum=${scri.perPageNum}"
+ "&searchType=${scri.searchType}"
+ "&keyword=${scri.keyword}"
+ "&rno="
+ $(this).attr("data-rno");
});
})