<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#content {
	height: 80%;
	width: 80%;
	margin: auto;
}

div.items div.itemImg {
	float: left;
	width: 350px;
}

div.items div.itemImg img {
	width: 350px;
	height: auto;
}

div.items div.itemInfo {
	float: right;
	width: 330px;
	font-size: 22px;
}

div.items div.itemInfo p {
	margin: 0 0 20px 0;
}

div.items div.itemInfo p span {
	display: inline-block;
	width: 100px;
	margin-right: 15px;
}

div.items div.itemInfo p.cartStock input {
	font-size: 22px;
	width: 50px;
	padding: 5px;
	margin: 0;
	border: 1px solid #eee;
}

div.items div.itemInfo p.cartStock button {
	font-size: 26px;
	border: none;
	background: none;
}

div.items div.itemInfo p.addToCart {
	text-align: right;
}

div.items div.itemDes {
	font-size: 18px;
	clear: both;
	padding-top: 30px;
}

section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}

section.replyList div.replyFooter button {
	font-size: 14px;
	border: 1px solid #999;
	background: none;
	margin-right: 10px;
}

div.replyModal {
	position: relative;
	z-index: 1;
	display: none;
}

div.modalBackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

div.modalContent {
	position: fixed;
	top: 20%;
	left: calc(50% - 250px);
	width: 500px;
	height: 250px;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

div.modalContent textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;
	height: 200px;
}

div.modalContent button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

div.modalContent button.modal_cancel {
	margin-left: 20px;
}
</style>

</head>
<body>
	<%@include file="../layout/header.jsp"%>
	<section id="container">
		<section id="content">
			<form role="form" method="post">
				<input type="hidden" name="itemNum" value="${view.itemNum}" />
			</form>

			<div class="items">
				<div class="itemImg">
					<img src="${view.itemImg}">
				</div>

				<div class="itemInfo">
					<p class="itemName">
						<span>상품명</span> ${view.itemName}
					</p>

					<p class="cateName">
						<span>카테고리</span> ${view.cateName}
					</p>

					<p class="itemPrice">
						<span>가격</span>
						<fmt:formatNumber pattern="###,###,###" value="${view.itemPrice}" />
						원
					</p>

					<p class="itemStock">
						<span>재고</span>
						<fmt:formatNumber pattern="###,###,###" value="${view.itemStock}" />
						EA
					</p>
					<c:if test="${view.itemStock !=0}">

						<p class="cartStock">
							<span>구입 수량</span>
							<button type="button" class="plus">+</button>
							<input type="number" class="numBox" min="1"
								max="${view.itemStock}" value="1" readonly="readonly" />
							<button type="button" class="minus">-</button>
							<script>
					    $(".plus").click(function(){
					     var num = $(".numBox").val();
					     var plusNum = Number(num) + 1;
					     
					     if(plusNum >= ${view.itemStock}) {
					      $(".numBox").val(num);
					     } else {
					      $(".numBox").val(plusNum);            
					     }
					    });
					    
					    $(".minus").click(function(){
					     var num = $(".numBox").val();
					     var minusNum = Number(num) - 1;
					     
					     if(minusNum <= 0) {
					      $(".numBox").val(num);
					     } else {
					      $(".numBox").val(minusNum);            
					     }
					    });
					   </script>
						</p>

						<p class="addToCart">
							<button type="button" class="addCart_btn">카트에 담기</button>

							<script>
    $(".addCart_btn").click(function(){
     var itemNum = $("#itemNum").val();
     var cartStock = $(".numBox").val();
        
     var data = {
    	itemNum : itemNum,
       cartStock : cartStock
       };
     
     $.ajax({
      url : "/shop/view/addCart",
      type : "post",
      data : data,
      success : function(result){
    	  if(result == 1) {
    		     alert("카트 담기 성공");
    		     $(".numBox").val("1");
    		    } else {
    		     alert("회원만 사용할 수 있습니다.")
    		     $(".numBox").val("1");
    		    }
    		   },
    		   error : function(){
    		    alert("카트 담기 실패");
    		   }
    		  });
    		 });
   </script>
						</p>
					</c:if>

					<c:if test="${view.itemStock ==0}">
						<p>상품의 수량이 부족합니다.</p>
					</c:if>

				</div>

				<div class="itemDes">${view.itemDes}</div>
			</div>

			<div id="reply">

				<c:if test="${member == null }">
					<p>
						소감을 남기시려면 <a href="/">로그인</a>해주세요
					</p>
				</c:if>

				<c:if test="${member != null}">
					<section class="replyForm">
						<form role="form" method="post" autocomplete="off">
							<input type="hidden" name="itemNum" id="itemNum"
								value="${view.itemNum}">
							<div class="input_area">
								<textarea name="repCon" id="repCon"></textarea>
							</div>

							<div class="input_area">
								<button type="button" id="reply_btn">소감 남기기</button>
								<script>
   $("#reply_btn").click(function(){
    
    var formObj = $(".replyForm form[role='form']");
    var itemNum = $("#itemNum").val();
    var repCon = $("#repCon").val();
    
    var data = {
    	itemNum : itemNum,
        repCon : repCon
      };
    
    $.ajax({
     url : "/shop/view/registerReply",
     type : "post",
     data : data,
     success : function(){
      replyList();
      $("#repCon").val("");
     }
    });
   });
</script>
							</div>

						</form>
					</section>
				</c:if>

				<section class="replyList">
					<ol>

					</ol>
					<script> 
			function replyList(){
			   var itemNum = ${view.itemNum};
			   
			   $.getJSON("/shop/view/replyList" + "?n=" + itemNum, function(data){
			    var str = "";				    
					  $(data).each(function(){
					   
			     console.log(data);
					     
			     var regDate = new Date(this.regDate);				     
			     regDate = regDate.toLocaleDateString("ko-US")
					     
				str += "<li data-repNum='" + this.repNum + "'>"
				+ "<div class='userInfo'>"
				+ "<span class='userName'>" + this.userName + "</span>"
				+ "<span class='date'>" + regDate + "</span>"
				+ "</div>"
				+ "<div class='replyContent'>" + this.repCon + "</div>"
					    
			    + "<c:if test='${member != null}'>"
					    
			    + "<div class='replyFooter'>"
			    + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button>"
			    + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
			    + "</div>"
					    
			    + "</c:if>"
					    
			    + "</li>";
			     });
					    
				$("section.replyList ol").html(str);
					   });
					}
</script>
					<script>
					replyList();
				</script>
				</section>
			</div>
			<div class="replyModal">

				<div class="modalContent">

					<div>
						<textarea class="modal_repCon" name="modal_repCon"></textarea>
					</div>

					<div>
						<button type="button" class="modal_modify_btn">수정</button>
						<button type="button" class="modal_cancel">취소</button>
					</div>

				</div>

				<div class="modalBackground"></div>

			</div>

			<script>
$(".modal_cancel").click(function(){
   $(".replyModal").fadeOut(200);
});


$(document).on("click", ".modify", function(){
	   $(".replyModal").fadeIn(200);
	   
	   var repNum = $(this).attr("data-repNum");
	   var repCon = $(this).parent().parent().children(".replyContent").text();
	   
	   $(".modal_repCon").val(repCon);
	   $(".modal_modify_btn").attr("data-repNum", repNum);
	   
	});
	
	
$(document).on("click", ".delete", function(){
 
var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
	   
if(deleteConfirm){
 var data = {repNum : $(this).attr("data-repNum")};
  
 $.ajax({
 	   url : "/shop/view/deleteReply",
 	   type : "post",
 	   data : data,
 	   success : function(result){
 	    
 	    if(result == 1) {
 	     replyList();
 	    } else {
 	    	console.log(result)
 	     alert("작성자 본인만 할 수 있습니다.");
 	    }
 	   },
 	   error : function(){
 	    alert("로그인하셔야합니다.")
 	    console.log(result)
 	   }
 	});
 }
});
$(".modal_modify_btn").click(function(){
	   var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	   
	   if(modifyConfirm) {
	    var data = {
	       repNum : $(this).attr("data-repNum"),
	       repCon : $(".modal_repCon").val()
	      };  // ReplyVO 형태로 데이터 생성
	    
	    $.ajax({
	     url : "/shop/view/modifyReply",
	     type : "post",
	     data : data,
	     success : function(result){
	      
	      if(result == 1) {
	       replyList();
	       $(".replyModal").fadeOut(200);
	       console.log(result)
	      } else {
	       alert("작성자 본인만 할 수 있습니다.");         
	      }
	     },
	     error : function(){
	      alert("로그인하셔야합니다.")
	     }
	    });
	   }
	});
</script>
		</section>
	</section>
</body>
</html>