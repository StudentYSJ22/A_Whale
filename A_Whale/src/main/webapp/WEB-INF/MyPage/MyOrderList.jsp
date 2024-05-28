<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="com.nbp.model.DTO.Member"%>
  <%@ page import="com.nbp.model.DAO.MemberDAO" %>
  <%@ page import="java.util.*,com.nbp.order.model.dto.MyPageOrder" %>
  <%@ page import="com.nbp.order.model.dao.OrderDAO" %>
  <%
	  Member loginMember=(Member)session.getAttribute("loginMember");
	
	  Cookie[] cookies=request.getCookies();
	  String saveId=null;
	  if(cookies!=null){
	     for(Cookie c : cookies){
	        if(c.getName().equals("saveId")){
	           saveId=c.getValue();
	           break;
	        }
	     }
	  }
	  String orderer=(String)request.getAttribute("MemberId");
	  //List <MyPageOrder>OrderList=(List<MyPageOrder>)request.getAttribute("OrderList");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: 'KoPubWorldDotum', sans-serif;
        background-color: #f0f0f0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background-color: white;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        width: 80%;
        text-align: center;
    }
    h2 {
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f4f4f4;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
</style>
</head>
<body>

	<div class="container">
        <h2>주문내역조회</h2>
        <table>
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>제품명+옵션명</th>
                    <th>주문일자</th>
                    <th>주문금액(수량)</th>
                    <th>주문상태</th>
                </tr>
            </thead>
            <tbody id="orderList">
                <!-- 주문 내역이 여기 표시됩니다 -->
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function() {
            const memberId = <%= orderer%>; // 서버에서 회원 ID를 전달받아 사용

            // 서버에서 주문 내역을 가져와서 테이블에 표시
            $.post("<%=request.getContextPath()%>/MyPage/getOrderLists.do", { <%=loginMember%>: memberId })
                .done(function(data) {
                    const orderList = $('#orderList');
                    data.forEach(order => {
                        const row = `<tr>
                            <td>${order.orderId}</td>
                            <td>${order.productName}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.orderAmount}</td>
                            <td>${order.orderStatus}</td>
                        </tr>`;
                        orderList.append(row);
                    });
                })
                .fail(function() {
                    alert('주문 내역을 불러오는 데 실패했습니다.');
                });
        });
    </script>

</body>
</html>