<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/itemView.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<section id="container">
			<form role="form" method="post">
				<input type="hidden" name="itemNum" value="${view.itemNum}" />
			</form>

			<div id="items">
				<div class="itemImg">
					<img src="${view.itemImg}">
				</div>

				<table class="itemInfo">
				<tr>
					<th class="itemName">상품명</th>
					<td> ${view.itemName}</td>
				</tr>
				<tr>
					<th class="cateName">카테고리</th> 
					<td>${view.cateName}</td>
				</tr>
				<tr>
					<th class="itemPrice">가격</th>
						<td><fmt:formatNumber pattern="###,###,###" value="${view.itemPrice}" />원</td>
				</tr>
				<tr>
					<th class="itemStock">재고</th>
						<td>
						<c:if test="${view.itemStock == 0 || view.itemStock < 0 }">
						품절입니다.
						</c:if>
						<c:if test="${view.itemStock > 0 }">
						<fmt:formatNumber pattern="###,###,###" value="${view.itemStock}" />
						EA
						</c:if>
						</td>
				</tr>
					<c:if test="${view.itemStock != 0}">
						<tr>
						<th class="cartStock">구입 수량</th>
						<td>
							<input type="number" class="numBox" min="1"
								max="${view.itemStock}" value="0" />
							
						</td>
						</tr>
						<tr>
							<th>합계</th>
							<td><span id="total">0원</span></td>
						</tr>
						<script>
							$(".numBox").click(function(){
								$("#total").empty();
								var amount = (${view.itemPrice}*$(".numBox").val());
							 	amount = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								$("#total").append(amount+"원");
							});
						</script>
						<tr>
						<th class="addToCart" colspan="2">
							<button type="button" class="addCart_btn">장바구니</button>
							<script>
								$(".addCart_btn").on("click", function(e){
									var itemNum = $("#itemNum").val();
								    var cartStock = $(".numBox").val();
								    
								    var data = {
										itemNum : itemNum,
										cartStock : cartStock};
								    
									$.ajax({
										url : "/shop/view/addCart",
										type: "post",
										data: data,
										success: function(result){
											cartAlert(result);
										}
									})
								});
								
								function cartAlert(result){
									if(result == '0'){
										alert("장바구니에 추가를 하지 못하였습니다.");
									} else if(result == '1'){
										alert("장바구니에 추가되었습니다.");
									} else if(result == '2'){
										alert("장바구니에 이미 추가되어져 있습니다.");
									} else if(result == '5'){
										alert("로그인이 필요합니다.");	
									}
								}
							   </script>
						</th>
						</tr>
					</c:if>
				</table>
			</div>
			<hr id="itemHr">
			
				<div class="itemDes">${view.itemDes}</div>

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
								<p id="avg">평점</p>
								<select id="rating">
									<option value="0.5">0.5</option>
									<option value="1.0">1.0</option>
									<option value="1.5">1.5</option>
									<option value="2.0">2.0</option>
									<option value="2.5">2.5</option>
									<option value="3.0">3.0</option>
									<option value="3.5">3.5</option>
									<option value="4.0">4.0</option>
									<option value="4.5">4.5</option>
									<option value="5.0">5.0</option>
								</select>	
								<button type="button" id="reply_btn">소감 남기기</button>
								<script>
								   $("#reply_btn").click(function(){
								    
								    var formObj = $(".replyForm form[role='form']");
								    var itemNum = $("#itemNum").val();
								    var repCon = $("#repCon").val();
								    var rating = $("#rating").val();
								    
								    var data = {
								    	itemNum : itemNum,
								        repCon : repCon,
								        rating : rating
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

				<div class="replyList">
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
				+ "<span class='rating'>" + "평점 : "+ this.rating + "</span>"
				+ "<br>"
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
					    
				$("div.replyList ol").html(str);
					   });
					}
</script>
					<script>
					replyList();
				</script>
				</div>
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
 
var deleteConfirm = confirm("삭제하시겠습니까?");
	   
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
 	    alert("로그인 후 이용해주세.")
 	    console.log(result)
 	   }
 	});
 }
});
$(".modal_modify_btn").click(function(){
	   var modifyConfirm = confirm("수정하시겠습니까?");
	   
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
<%@include file="../layout/footer.jsp"%>