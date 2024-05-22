<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.nbp.product.model.DTO.Product, com.nbp.order.model.dto.Order" %>
<%
 	List<Order> orders=(List<Order>)request.getAttribute("orders");
	List<Product> products=(List<Product>)request.getAttribute("products");
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
</style>
<body>
    
    <header>
        <a href="#" class="brand">A_Whale</a>
        <div>헤더부분</div>
    </header>

    <div style="display: flex;">
        <section id="sidebar">
            <ul class="side-menu">
                <li>
                    <a href="#" class="dashboard">대쉬보드</a>
                </li>
                <li class="divider">사이트 관리</li>
                <li>
                    <a href="#">상품 관리</a>
                    <ul class="side-dropdown">
                        <li><a href="#">상품 조회</a></li>
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
                        <li><a href="#" id="orderBoard">주문 관리</a></li>
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
                        <li ><a href="#" id="noticeBoard">공지사항 관리</a></li>
                    </ul>
                </li>
            </ul>
        </section>
        
    
        <section id="Container">
            <section id="basicSection">
                <div>기본 섹션</div>
            </section>

            <section id="productSearch" style="display: none;">
                <div>상품 조회</div>
            </section>

            <section id="productUpdate" style="display: none;">
                <div>상품수정</div>
            </section>

            <section id="productInsert" style="display: none;">
                <div>상품등록</div>
            </section>

            <section id="manageCategory" style="display: none;">
                <div>카테고리 관리</div>
            </section>

            <section id="orderSection" style="display: none;">
                <div>
                	<div>주문 관리</div>
                </div>
                <div>
                	<h1>주문조회하기</h1>
			    <button id="fetchOrders">Fetch Orders</button>
			    
			    <table id="ordersTable">
			        <thead>
			        <%if(orders.isEmpty()){ %>
			        <tr> 조회된 주문이 없습니다
			        </tr>
			        <%
			        }else{
			        for (Order o:orders){%>
			            <tr>
			                <th>주문코드</th>
			                <th>주문자 이름</th>
			                <th>상품명</th>
			                <th>수량</th>
			                <th>가격</th>
			                <th>주문날짜</th>
			                <th>상태</th>
			            </tr>
			        </thead>
			        <tbody>
			        <tr>
			        	 <th>1<%=o.getOrderId() %></th>
			        	 <th>2<%=o.getOrderName() %></th>
<%-- 			        	 <th>3<%=o.getProductName() %></th>
 --%>			        	 <th>4<%=o.getOrderId() %></th>
			        	 <th>5<%=o.getOrderId() %></th>
			        	 <th>6<%=o.getOrderId() %></th>
			        	 <th>7<%=o.getOrderId() %></th>
			        </tr>
			        	 
			        	 
			        </tbody>
			     <%}
              }%>
			    </table>
                </div>
                
                
            </section>

            <section id="noticeSection" style="display:none;">
                <div>
                    <div>공지사항 관리</div>
                </div>
                <div>
                    공지사항 조회
                </div>
                <div>
                    <form action="<%=request.getContextPath()%>/">
                        <div class="row1" >
                            <div class="row2" >
                                제목
                            </div>
                            <div>
                                <input type="text" name="title" required>
                            </div>
                        </div>
                        <div class="row1" >
                            <div class="row2" >
                                작성자
                            </div>
                            <div>
                                <input type="text" name="writer" value=""> 
                                <!-- readOnly -->

                            </div>
                        </div>
                        <div class="row1" >
                            <div class="row2" >
                                첨부파일
                            </div>
                            <div>
                                <input type="file" name="upfile">
                            </div>
                        </div>
                        <div>
                            <div class="row2" style="margin: 10px 0;">
                                상세내용
                            </div>
                            <div style="margin: 0 30px;">
                                <textarea class="form-control" rows="10" cols="20" name="content" id="" style="resize: none;"></textarea>
                            </div>
                        </div>
                        <div style="margin: 20px 0; text-align: center;">
                            <input type="submit" value="등록하기">
                        </div>
                    </form>
                </div>
            </section>
        </section>
        
    </div>
    

    <script>
        const allDropdown = document.querySelectorAll('#sidebar .side-dropdown');
        allDropdown.forEach(item=>{
            const a = item.parentElement.querySelector('a:first-child');
            // console.log(a);
            a.addEventListener('click', function(e){
                e.preventDefault();

                if(!this.classList.contains('active')){
                    allDropdown.forEach(i=>{
                        const aLink = i.parentElement.querySelector('a:first-child');

                        aLink.classList.remove('active');
                        i.classList.remove('show');
                    })
                }

                this.classList.toggle('active');
                item.classList.toggle('show');
            })
            
        })

        $(document).ready(function() {
            $('#noticeBoard').on('click', function(event) {
            event.preventDefault();

            $('#basicSection').hide();
            $('#noticeSection').show();
            // $('section[id="noticeSection"]:not(#basicSection)').hide();
	        });
	    });
        
        
        
        
        
        $(document).ready(function() {
            $('#orderBoard').on('click', function(event) {
            event.preventDefault();

            $('#basicSection').hide();
            $('#orderSection').show();
            // $('section[id="noticeSection"]:not(#basicSection)').hide();
	        });
	    });

        /* 가져오기 */
        document.getElementById('fetchOrders').addEventListener('click', () => {
            fetch('/api/orders')
                .then(response => response.json())
                .then(data => {
                    const tableBody = document.getElementById('ordersTable').querySelector('tbody');
                    tableBody.innerHTML = ''; // Clear existing rows

                    data.forEach(order => {
                        const row = document.createElement('tr');

                        row.innerHTML = `
                            <td>${orders.order_id}</td>
                            <td>${orders.customer_name}</td>
                            <td>${orders.product_name}</td>
                            <td>${orders.quantity}</td>
                            <td>${orders.price}</td>
                            <td>${orders.order_date}</td>
                            <td>${orders.status}</td>
                        `;

                        tableBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Error fetching orders:', error);
                });
        });


    
  
    </script>


</body>
</html>