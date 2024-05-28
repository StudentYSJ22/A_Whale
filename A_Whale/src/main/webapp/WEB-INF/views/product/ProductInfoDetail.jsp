<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.nbp.product.review.model.DTO.Review,com.nbp.product.review.model.DTO.Qna,com.nbp.product.model.DTO.Product" %>
<%@ include file="/WEB-INF/common/sessionInfo.jsp" %>

<%
	String pageBar=(String)request.getAttribute("pageBar"); 
	String qnaPageBar=(String)request.getAttribute("qnaPageBar"); 
	List<Review> reviews = (List<Review>)request.getAttribute("reviews");
	List<Qna> qnas = (List<Qna>)request.getAttribute("qnas");

%>





<style>
body {
	background-image:
		url("https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
	background-size: 100%;
	font-family: KoPubWorldDotum;
}

@font-face {
	font-family: 'Freesentation-9Black';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2')
		format('woff2');
}

#product-detail-main {
	display: flex;
	justify-content: center;
	align-items: center;
	justify-content: space-evenly;
	background-color: rgba(255, 255, 255, 0.7);
	margin-top: 30px;
	position: sticky;
	top: 120px;
	z-index: 500;
}

#product-detail-main>div {
	display: flex;
	justify-content: center;
	opacity: 0.5;
	align-items: center;
	color: rgb(10, 10, 169);
	width: 170px;
	height: 50px;
	font-family: 'Freesentation-9Black';
	font-weight: lighter;
	border-bottom: 5px solid rgba(216, 216, 216, 0);
	transition: all 0.2s ease-in;
	cursor: pointer;
	font-size: 25px;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.717);
}

#product-detail-main>div:first-of-type {
	opacity: 1;
	border-bottom: 5px solid rgb(10, 10, 169)
}

#product-detail-main>div:hover {
	opacity: 1;
	border-bottom: 5px solid rgb(8, 8, 136);
}

#information-main-container {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 60%;
	margin: 0 auto;
}

#information-container {
	position: relative;
	height: 1000px;
	margin-top: 60px;
}

.information-img {
	width: 100%;
}

.gradation {
	width: 100%;
	position: absolute;
	bottom: 0px;
	box-shadow: inset 0 -2px 0 0 #ffffff;
}

.information-more-btn {
	position: absolute;
	width: 100%;
	bottom: 0;
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.information-more-btn>img {
	margin-left: auto;
	margin-right: auto;
	opacity: 1;
	cursor: pointer;
	transition: all 0.25s ease-in;
}

.information-more-btn>img:hover {
	opacity: 0.7;
}
/* ----------------리뷰 테이블 스타일 ----------------------- */
#product-review {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	width: 100%;
	margin-bottom: 100px;
	margin-top: 150px;
	border-top: 3px solid rgb(125, 125, 125);
 	text-align: center;
}

#review-title {
	font-family: 'Freesentation-9Black';
	font-size: 25px;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.717);
	color: rgb(10, 10, 169);
	margin: 40px 0;
}

.review-table {
	width: 100%;
	border-collapse: collapse;
	border-top: 1.5px solid rgb(10, 10, 169);
	border-bottom: 1.5px solid rgb(10, 10, 169);
	border-left: none;
	border-right: none;
}

.review-table th, .review-table td {
	padding: 12px 15px;
	text-align: center; /* 텍스트 중간 정렬 */
}

.review-table th {
	/* border-bottom: 1.5px solid rgb(10, 10, 169); */ /* 헤더 배경색 */
	font-weight: bold;
}

.review-table img {
	width: 100px;
	height: auto;
}

.review-table tbody tr:nth-child(even) {
	background-color: rgba(255, 255, 255, 0.45); /* 짝수 행 배경색 */
}

.review-table tbody tr:hover {
	background-color: #f1f1f1; /* 마우스 오버 시 배경색 */
}

.review-table tbody tr:hover {
	background-color: rgba(163, 163, 182, 0.326); /* 연한 회색 배경색 */
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}
/* ----------------- 페이지 바 스타일 ----------- */
#pagebar>* {
	margin: 0 10px;
}

#pagebar>div {
	font-weight: bolder;
	font-size: 20px;
}

#pagebar {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 40px;
}

#pagebar>div>a {
	text-decoration: none;
	color: black;
	margin-bottom: 3px;
}

/* ----------------------------Q&A ------------------------------- */

#product-qna {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	width: 100%;
	margin-bottom: 200px;
	margin-top: 100px;
	border-top: 3px solid rgb(125, 125, 125);
 	text-align: center;
}

#qna-title {
	font-family: 'Freesentation-9Black';
	font-size: 25px;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.717);
	color: rgb(10, 10, 169);
	margin: 40px 0;
}

		.review-table th:nth-child(1),
	  .review-table td:nth-child(1) {
	      width: 9%;
	  }
	  .review-table th:nth-child(3),
	  .review-table td:nth-child(3) {
	      width: 5%;
	  }
	  .review-table th:nth-child(4),
	  .review-table td:nth-child(4) {
	      width: 12%;
	  }
	  /* -----------qna 등록 버튼 ------------- */
	  #qnaInsertBtn{
	  		float:right;
            width: 200px;
			height:25px;
			padding-top:2px;
            background-color: rgb(10, 10, 169);
            margin:5px;
            border-radius: 5px;
            color:white;
            font-weight:bolder;
            box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.717);
            cursor:pointer;
	  }
	   #qnaInsertBtn:hover{
	   		opacity:0.7;
	   
	   }
	  /* -------------Q&A 모달창 스타일 ---------------- */
		.modal {
		    display: none;
		    position: fixed; /* 화면에 고정 */
		    z-index: 1; /* 다른 요소들 위에 표시 */
		    left: 0;
		    top: 0;
		    width: 100%; /* 전체 화면 너비 */
		    height: 100%; /* 전체 화면 높이 */
		    overflow: auto; /* 필요한 경우 스크롤 */
		    background-color: rgb(0,0,0); /* 백그라운드 색상 */
		    background-color: rgba(0,0,0,0.4); /* 백그라운드 불투명도 */
		}
		
		/* 모달 콘텐츠 */
		.modal-content {
		    background-color: #fefefe;
		    margin: 15% auto; /* 중앙 정렬 */
		    padding: 20px;
		    border: 1px solid #888;
		    width: 80%; /* 너비 설정 */
		    max-width: 500px; /* 최대 너비 설정 */
		}
		
		/* 닫기 버튼 */
		.qnaClose {
		    color: #aaa;
		    float: right;
		    font-size: 35px;
		    font-weight: bold;
		}
		
		.qnaClose:hover,
		.qnaClose:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
		
		/* 입력 폼 스타일 */
		form label {
		    display: block;
		    margin-top: 10px;
		}
		
		form input[type="text"],
		form textarea {
		    width: 100%;
		    padding: 10px;
		    margin-top: 5px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    box-sizing: border-box;
		}
		
		form textarea {
		    height: 100px;
		    resize: none; /* 크기 조정 불가능 */
		}
		
		form button {
		    margin-top: 10px;
		    padding: 10px 20px;
		    background-color: #4CAF50;
		    color: white;
		    border: none;
		    cursor: pointer;
		}
		
		form button#cancelBtn {
		    background-color: red;
		}
		
		form button:hover {
		    opacity: 0.8;
		}

</style>




<div style="height: auto;">
	<!-- information ,review, Q&A 카테고리 생성 -->
	<div id="product-info-list" class="border"
		style="height: 15px; margin-top: 20px; border-bottom: 8px solid rgb(9, 9, 71); border-top: 3px solid rgb(9, 9, 71);"></div>
	<div id="product-detail-main" class="border">
		<div>information</div>
		<div>review</div>
		<div>Q&A</div>
	</div>

	<script>
      // 상품정보,리뷰,질문 클릭 이벤트
    $("#product-detail-main>div").click(e=>{
      $(e.target).parent().children().css("opacity",0.5);
      $(e.target).css("opacity",1);
    
      $(e.target).parent().children().css("border-bottom","5px solid rgba(10, 10, 169,0)");
      $(e.target).css("border-bottom","5px solid rgb(8, 8, 136)");
    });


    
    </script>

	<!-- 상세페이지 설명, 이미지 -->
	<div id="information-main-container">
		<div id="information-container">
			<div id="information-img" style="height: 1000px; overflow: hidden;">
				<img class="information-img" src="https://i.imgur.com/VON4Oy9.jpeg">
			</div>
			<div>
				<img class="gradation" src="https://i.imgur.com/CwX3HEQ.png">
			</div>
			<div class="information-more-btn">
				<img src="https://i.imgur.com/SBtS55i.png" width="200px">
			</div>
		</div>
	</div>

	<script>
        // 제품 상세에서 더보기 버튼 클릭시 이미지 나오게 하는 함수
            $(document).on('click', '.information-more-btn', function() {
        $("#information-img").css('height','auto');
        document.getElementById("information-img").style.overflow='visible';
        $("#information-container").css('height','auto');

        document.getElementById("information-container").style.overflow='visible';
        $(".gradation").css("display","none");
        $(".information-more-btn").css("display","none");
});
      </script>

	<!-- 리뷰 테이블 생성 -->
	<div id="product-review">
		<div id="review-title">review</div>
		<div id="reviewResult"
			style="display: flex; flex-direction: column; align-items: center; width: 60%;">
			<table class='review-table' width="100%">
				<thead>
					<tr>
						<th>no.</th>
						<th>리뷰 제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="ajaxReviewTbody" class="table-group-divider">

					<%
					if (!reviews.isEmpty()) {
						for (Review r : reviews) {
					%>
					<tr class="review-detail">
						<td><%=r.getReviewNo()%></td>
						<td><%=r.getReviewTitle()%></td>
						<td><%=r.getMemberId()%></td>
						<td><%=r.getReviewEnrollDate()%></td>
					</tr>
					<tr class="review-content">
						<td colspan='1' style="padding: 30px;"><img
							src="https://i.imgur.com/spsVERs.png" alt="Review Image 1"
							width="200"> <img src="https://i.imgur.com/spsVERs.png"
							alt="Review Image 1" width="200"></td>
						<td colspan='4' style="padding: 30px;"><%=r.getReviewContent()%>
						</td>
					</tr>
					<%}
					}%>
				</tbody>
			</table>
			<!-- 페이지 바 -->
			<%=pageBar%>
		</div>
	</div>
<script>
      
        
        /* ajax 페이지 번호 클릭시 리뷰페이지 변환 */
        $(document).on('click', '.cPage', function() {
        	let cPage = $(this).text();
        	let productNo = $("#review-productNo").text();
        	console.log(cPage);
        	console.log(productNo);
        	$.get("<%=request.getContextPath()%>/product/reviewall.do?ajaxcPage="+cPage+"&ajaxProductNo="+productNo)
        	.done(data=>{
        		document.getElementById("reviewResult").innerHTML=data;
                $('.review-content').hide();
        	});
        	
        })
        /* 리뷰 페이지 다음 버튼 구현 */
        let productNo = "";
        $(document).on('click', '#reviewPageNext', function() {
        	let cPage = $("#cPageNext").text();
        	
        	let productNo = $("#review-productNo").text();
        	
        	let nextcPage = Math.floor((Number(cPage) - 1) / 3 + 1) * 3 + 1;
        	
        	$.get("<%=request.getContextPath()%>/product/reviewall.do?ajaxcPage="+nextcPage+"&ajaxProductNo="+productNo)
        	.done(data=>{
        		document.getElementById("reviewResult").innerHTML=data;
                $('.review-content').hide();
        	});
        });
        
        /* 리뷰 페이지 이전 버튼 구현 */
      	    $(document).on('click', '#reviewPagePrev', function() {
        	 let cPage = $("#cPageNext").text();
         	
         	let productNo = $("#review-productNo").text();
         	
         	let prevcPage = (Math.floor((Number(cPage) - 1) / 3) - 1) * 3 + 1;;
         	
         	$.get("<%=request.getContextPath()%>/product/reviewall.do?ajaxcPage="+prevcPage+"&ajaxProductNo="+productNo)
         	.done(data=>{
         		document.getElementById("reviewResult").innerHTML=data;
                 $('.review-content').hide();
         	});
         });
         
         
        
        /* 리뷰 게시판 클릭시 하단에 내용 나오는 로직 구현 */
        $(document).ready(function() {
            $('.review-content').hide();
            
            $(document).on('click', '.review-detail', function() {
              let contentRow = $(this).next('.review-content');
              $('.review-content').not(contentRow).slideUp(1);
                contentRow.slideToggle(1);
            });
        });
    </script>
    
    
    <!-- -----------------------Q&A 게시판 제작 ------------------------------------- -->
    
    
    <div id="product-qna">
		<div id="qna-title">Q&A</div>
		<div style="width:60%; margin-bottom:5px;">
			<div id="qnaInsertBtn">상품 Q&A 작성하기</div>
			
			
			<!--------------------- 상품 문의 모달창  ---------------------------->
			
			
			 <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="qnaClose">&times;</span>
            <h2>문의하기</h2>
            <form action="<%=request.getContextPath()%>/product/productqna.do">
                <label for="userId">아이디</label>
                <% if(loginMember!=null){ %>
                <input type="text" id="userId" name="userId" value='<%=loginMember.getMemberId()%>' required readOnly><br><br>
				<%}else{ %>
				 <input type="text" id="userId" name="userId" required readOnly><br><br>
				 <%} %>
				<input id="qnaProductQna" name="productName" value='<%=p.getProductName()%>' style='display:none;'>
				
                <label for="queryTitle">문의 제목</label>
                <input type="text" id="queryTitle" name="queryTitle" required><br><br>

                <label for="queryContent">문의 내용</label>
                <textarea id="queryContent" name="queryContent" required></textarea>
                <div id="byteCounter" style="float:right; font-size:13px;">0/1000 bytes</div><br><br>

                <label for="private">비공개</label>
				<input type="hidden" name="private" value="false">
				<input type="checkbox" id="private" name="private" value="true"><br><br>

                <button type="button" id="cancelBtn">취소</button>
                <button type="submit" id="submitBtn">확인</button>
            </form>
        </div>
    </div>
			
			
		</div>
		<div id="qnaResult"
			style="display: flex; flex-direction: column; align-items: center; width: 60%;">
			<table class='review-table' width="100%">
				<thead>
					<tr>
						<th>답변상태</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="ajaxReviewTbody" class="table-group-divider">
					<%
						if (!qnas.isEmpty()){
							for(Qna q : qnas){
					%>
						<tr class="qna-detail">
						<%if(q.getQnaAnswerContent()!=null){ %>
							<td style="font-weight:bolder; color:blue;">답변완료</td>
							<%}else{%>
							<td>미답변</td>
							 <%} %>
							 
							 <!-- 공개글 혹은 본인 글일때 보이게 처리 -->
							 
						<%if(q.getQnaSecretYn()==1 || q.getMemberId().equals(" ")) {%>
							<td>제품 문의드립니다.</td>
							<td><%=q.getMemberId() %></td>
							<td><%=q.getQnaEnrollDate() %></td>
						</tr>
						<tr class="qna-content">
							<td colspan='5' style="padding: 30px;">
								 <span style="float:left;"><%=q.getQnaContent()%></span>
								   <br><br><hr><br>
								   <%if(q.getQnaAnswerContent()!=null){ %>
								 <span style="float:left;">└답변 : <%=q.getQnaAnswerContent() %></span>
								 <%}else{%>
								 <span style="float:left;">답변 대기중입니다.</span>
								 <%} %>
							</td>
						</tr>
						
						
						
						<!-- 비공개글 처리 -->
						
						<%}else{ %>
						<td>비공개 글입니다.🔒</td>
							<td><%=q.getMemberId() %></td>
							<td><%=q.getQnaEnrollDate() %></td>
						</tr>
						<tr class="qna-content">
							<td colspan='5' style="padding: 30px;">
								 <span style="float:left;">비공개 글입니다.🔒</span>
								   <br><br><hr><br>
								   <%if(q.getQnaAnswerContent()!=null){ %>
								 <span style="float:left;">└답변 : 비공개 글입니다.🔒</span>
								 <%}else{%>
								 <span style="float:left;">답변 대기중입니다.</span>
								 <%} %>
							</td>
						</tr>
						<%} %>
						
					<%}
					}%>
				</tbody>
			</table>
			<!-- 페이지 바 -->
			<%=qnaPageBar%>
		</div>
	</div>
	</div>
		<script>
		
		
		
		
	      /* ajax 페이지 번호 클릭시 qna페이지 변환 */
        	$(document).on('click', '.qnacPage', function() {
        	let cPage = $(this).text();
        	let productName=$(".product-title").text();
        	$.get("<%=request.getContextPath()%>/product/qnaall.do?ajaxcPage="+cPage+"&productName="+productName)
        	.done(data=>{
        		console.log(data);
        		document.getElementById("qnaResult").innerHTML=data;
                $('.qna-content').hide();
        	});
        	
        })
        
        /* qna 게시판 클릭시 하단에 내용 나오는 로직 구현 */
        $(document).ready(function() {
            $('.qna-content').hide();
            
            $(document).on('click', '.qna-detail', function() {
              let contentRow = $(this).next('.qna-content');
              $('.qna-content').not(contentRow).slideUp(1);
                contentRow.slideToggle(1);
            });
        });
	      
	 
          
          /* qna 페이지 이전 버튼 구현 */
    	    $(document).on('click', '#qnaPagePrev', function() {
      	 let cPage = $("#cPageNext_qna").text();
       	
      	let productName=$(".product-title").text();
       	
       	let prevcPage = (Math.floor((Number(cPage) - 1) / 3) - 1) * 3 + 1;
       	
       	$.get("<%=request.getContextPath()%>/product/qnaall.do?ajaxcPage="+prevcPage+"&productName="+productName)
       	.done(data=>{
       		document.getElementById("qnaResult").innerHTML=data;
               $('.qna-content').hide();
       	});
       });
          
    	    /* qna 페이지 다음 버튼 구현 */
            $(document).on('click', '#qnaPageNext', function() {
            	let cPage = $("#cPageNext_qna").text();
            	
            	let productName=$(".product-title").text();
            	
            	let nextcPage = Math.floor((Number(cPage) - 1) / 3 + 1) * 3 + 1;
            	
            	$.get("<%=request.getContextPath()%>/product/qnaall.do?ajaxcPage="+nextcPage+"&productName="+productName)
            	.done(data=>{
            		document.getElementById("qnaResult").innerHTML=data;
                    $('.qna-content').hide();
            	});
            });
		
    	    
    	    
    /* 상품 Q&A 작성하기 버튼기능 구현 / 모달창  */
    document.addEventListener('DOMContentLoaded', (event) => {
	    // 모달 엘리먼트
	    var modal = document.getElementById("myModal");
	    // 모달을 여는 버튼
	    var btn = document.getElementById("qnaInsertBtn");
	    // 모달을 닫는 span 엘리먼트
	    var span = document.getElementsByClassName("qnaClose")[0];
	    // 취소 버튼
	    var cancelBtn = document.getElementById("cancelBtn");
	    // 문의 내용 입력란
	    var queryContent = document.getElementById("queryContent");
	    // 바이트 카운터
	    var byteCounter = document.getElementById("byteCounter");
	    // 최대 바이트 수
	    var maxBytes = 1000;
	    // 모달을 여는 이벤트 핸들러
	    btn.onclick = function() {
	    <% if(loginMember!=null){ %>
	        modal.style.display = "block";
	    <%}else{%>
	    	alert("로그인 후 이용해주세요.");
	   	<%}%>
	    }
	    // 모달을 닫는 이벤트  - x버튼
	    span.onclick = function() {
	        modal.style.display = "none";
	    }
	    // 모달을 닫는 이벤트  - 닫기 버튼
	    cancelBtn.onclick = function() {
	        modal.style.display = "none";
	    }
	    // 모달을 닫는 이벤트  - 모달 밖 아무곳이나
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	});
    	    
    	    
    	    
		</script>
		
		
		
</div>
    





