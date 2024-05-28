<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.nbp.product.model.DTO.Product,com.nbp.order.model.dto.Order, com.nbp.model.DTO.Member,java.text.SimpleDateFormat, com.nbp.notice.model.dto.Notice" %>
<%
	List<Order> orders=(List<Order>)request.getAttribute("orders");
	List<Product> products=(List<Product>)request.getAttribute("products");
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
	Member loginMember =(Member) (Member)session.getAttribute("loginMember");
%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<style>
    *{  
        margin: 0;
        padding: 0;
        list-style: none;
    }
    a{
        text-decoration: none; /*밑줄이 사라진다*/
    }
    header{
        height: 60px;
        display: flex;
        border-bottom: 1px solid black;
    }
    #navbar{
        
        width: 230px;
        border: 1px solid black;
    }
    #Container{
        width: 100%;
        border: 1px solid black;
    }






    #sidebar{
        
        width: 260px;

        /* 위쪽왼쪽에 마진0으로 주기 */
        top: 0;
        left: 0;
        height: 100%;
        
        overflow-y: auto;
        scrollbar-width: none;
    }
     /* #sidebar::-webkit-scrollbar{
        display: none;
     } */
    header .brand{
        font-size: 24px;
        font-weight: 800;     
        display: flex;
        justify-content: center;
        align-items: center; 
    }
  
 


    #sidebar .side-menu{
        margin: 36px 0; /*위아래만 마진주기, 좌우는 0으로*/
        padding: 0 20px;
    }
    #sidebar .side-menu a{
        font-size: 15px;
        font-weight:bolder;
        color: black;

        display: flex;  /*아이콘이랑 목록이 좌우정렬*/
        align-items: center;
        padding: 12px 16px 12px 0; /*top right bottom left*/
        
        

       
    }

    
    #sidebar .side-menu > li > a.active,
    #sidebar .side-menu > li > a.active:hover{
        background:rgb(154, 154, 171);
        color: #d9d7dfed;
    }

    #sidebar .divider{
        font-size: 12px;
        font-weight: 700;
        color: darkgray;
        margin-top: 24px;


    }
    #sidebar .side-dropdown{
        padding-left: 60px; 

        max-height: 0;
        overflow-y:hidden;
    }
  /* 추가 */
    #sidebar .side-dropdown.show{
        max-height: 1000px;
    }

    #sidebar .side-dropdown a:hover{
        color: #1775F1;
    }

  
    #sidebar .btn-upgrade{
        font-size: 14px;
        font-weight: 600;

        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 12px;
        padding: 12px 0;

    }
 



    textarea .form-control{
        min-height: 85px;
        line-height: 20px;
    }
    .form-control{
        width: 100%;

    }
    .row1{
        display: flex; 
        margin: 10px 0;
    }
    .row2{
        width: 10%; 
        text-align: center;
    }
    
    

    .form-container {
        display: none; /* 처음에는 form이 보이지 않도록 설정 */
    }
 
</style>
<body>
    
    <header>
        <a href="#" class="brand">A_Whale</a>
        <div>헤더부분</div>
    </header>

    <div style="display: flex; border-bottom:1px solid black;">
        <section id="sidebar">
            <ul class="side-menu">
                <li>
                    <a href="#" class="dashboard">대쉬보드</a>
                </li>
                <li class="divider">사이트 관리</li>
                <li>
                    <a href="#" >상품 관리</a>
                    <ul class="side-dropdown">
                        <li><a href="#" id="productBoard" data-target="orderSection">상품 조회</a></li>
                        <li><a href="#">상품 수정</a></li>
                        <li><a href="#">상품 등록</a></li>
                        
                        <li><a href="#">카테고리 관리</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">회원 관리</a>
                    <ul class="side-dropdown">
                        <li><a href="#">회원 조회</a></li>
                        <li><a href="#">회원 정보 수정</a></li>
                        <li><a href="#">회원 추가</a></li>
                        <li><a href="#">메일 발송 설정</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">주문 관리 </a>
                    <ul class="side-dropdown">
                        <li><a href="#" id="orderBoard" data-target="orderSection">주문 관리</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">문의/리뷰게시판 관리</a>
                    <ul class="side-dropdown">
                        <li><a href="#">문의게시판 관리</a></li>
                        <li><a href="#">리뷰게시판 관리</a></li>
                        <li><a href="#">리뷰이벤트 관리</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">게시판 관리</a>
                    <ul class="side-dropdown">
                        <li ><a href="<%=request.getContextPath()%>/admin/adminnotice.do" data-target="noticeSection">공지사항 관리</a></li>
                    </ul>
                </li>
            </ul>
        </section>
        <section id="content" style="width:70%; border-left: 1px solid black; ">
        
        </section> 
    </div>
    
    <script>
        const allDropdown = document.querySelectorAll('#sidebar .side-dropdown');
        const sections = document.querySelectorAll('#Container > section');
        const links = document.querySelectorAll('#sidebar .side-menu a[data-target]');

        allDropdown.forEach(item => {
            const a = item.parentElement.querySelector('a:first-child');
            a.addEventListener('click', function (e) {
                e.preventDefault();

                if (!this.classList.contains('active')) {
                    allDropdown.forEach(i => {
                        const aLink = i.parentElement.querySelector('a:first-child');
                        aLink.classList.remove('active');
                        i.classList.remove('show');
                    });
                }

                this.classList.toggle('active');
                item.classList.toggle('show');
            });
        });
        
        $(document).ready(function(){
            $(".side-menu a[data-target]").click(function(event){
                event.preventDefault();
                var target = $(this).data("target");
                var url = $(this).attr("href");

                $("#content").load(url);
            });
        });
        
        

        /* links.forEach(link => {
            link.addEventListener('click', function (e) {
                e.preventDefault();
                const targetId = this.getAttribute('data-target');

                sections.forEach(section => {
                    section.style.display = section.id === targetId ? 'block' : 'none';
                });

                links.forEach(link => {
                    link.classList.remove('active');
                });
                this.classList.add('active');
            });
        });
    
        
        document.getElementById('noticeButton').addEventListener('click', function() {
            var formContainer = document.getElementById('formContainer');
            if (formContainer.style.display === 'none' || formContainer.style.display === '') {
                formContainer.style.display = 'block';
            } else {
                formContainer.style.display = 'none';
            }
        }); */
  
     
        
        
        
        //결제관련
        <%-- function searchPayments() {
            $.ajax({
                url: "<%=request.getContextPath()%>/admin/getAllPayments.do",
                type: 'GET',
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    console.log("서버 응답:", response); // 응답 내용을 콘솔에 출력
                    try {
                        // JSON 응답 형식 확인
                        if (typeof response === "string") {
                            response = JSON.parse(response);
                        }
                        console.log("파싱된 응답:", response);
                        if (response.response) {
                            displayPaymentsInfo(response.response.list); // "list" 필드를 사용
                        } else if (response.error) {
                            alert("서버 에러: " + response.error);
                        } else {
                            alert("결제 정보가 없습니다.");
                        }
                    } catch (error) {
                        alert("결제 정보를 파싱하는 중 오류가 발생했습니다.");
                        console.log("파싱 오류:", error);
                    }
                },
                error: function(error) {
                    alert("결제 정보를 조회할 수 없습니다.");
                    console.log("AJAX 오류:", error);
                }
            });
        }

        function displayPaymentsInfo(paymentInfos) {
            let html = '<table border="1">' +
			            '<tr>' +
			            '<th>UID/MID</th>' +
			            '<th>주문명</th>' +
			            '<th>고객정보</th>' +
			            '<th>결제 상태</th>' +
			            '<th>결제대행사</th>' +
			            '<th>결제 금액</th>' +
			            '<th>구분</th>' +
			            '<th>결제 방법</th>' +
			            '<th>결제 일시</th>' +			      
			            '<th>상태승인시각</th>' +
			            '</tr>';
            paymentInfos.forEach(function(paymentInfo) {
            	html += '<tr>';
                html += '<td>' + paymentInfo.imp_uid + '</td>';
                html += '<td>' + paymentInfo.name + '</td>';
                html += '<td>' + paymentInfo.buyer_name + '</td>';
                html += '<td>' + paymentInfo.status + '</td>';
                html += '<td>' + paymentInfo.pg_provider + '</td>';
                html += '<td>' + paymentInfo.amount + '</td>';
                html += '<td>' + paymentInfo.type + '</td>';
                html += '<td>' + paymentInfo.pay_method + '</td>';
                html += '<td>' + new Date(paymentInfo.paid_at * 1000).toLocaleString() + '</td>';
                html += '<td>' + new Date(paymentInfo.approval_time * 1000).toLocaleString() + '</td>';
                html += '</tr>';
            });
            html += '</table>';
            document.getElementById("paymentInfos").innerHTML = html;
        } --%>
        
        
       
    </script>


</body>
</html>