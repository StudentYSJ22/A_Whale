<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.nbp.model.DTO.Member"%>
    <%@ page import="com.nbp.model.DAO.MemberDAO" %>
    <%
    Member loginMember=(Member)session.getAttribute("loginMember");
    String MemberId=loginMember.getMemberId();

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
    request.setAttribute("loginMember", loginMember);
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/common/subHeader.jsp" %> 
<title>Insert title here</title>
</head>
<body>
<style>
    #menubar>ul>li{
        list-style: none;
        text-decoration-line: none;
        margin-bottom: 15px;
        border: 1px solid red;
        width: 150px;
    }
    #brandlogo{
        border: 1px solid red;
    }
    #mypage{
        border: 1px solid red;
    }#content{
        display: inline-block;
        border: 1px solid red;
    }
    #menubar{
        width: 150px;
    }
    .aside{
            /* border: 1px dotted blue; */
            border: 1px solid black;
            width: 15%;
            height: 800px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            justify-content: space-evenly;
         
            
        }
        .aside>nav>ul{
            height: 650px;
            list-style-type:none ;
            margin: 0;
            padding: 0;
            
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }
        .aside>nav>ul>li{
            
            font-family: "휴먼굴림둥근체";
            font-weight: bolder;
            margin-top: 0;
            
        }
        .article{
            /* border: 1px dotted blue; */
            border: 1px solid black;
            width: 85%;
            height: 800px;
            display: flex;
            flex-wrap: wrap;
            margin: 0;
            

        }
        .section{
            display: flex;
            margin-top: 100px;

        }
        .aside a{
            list-style: none;
        text-decoration-line: none;
        font-size: 13px;
        }
        #top{
            display: flex;
            justify-content: center;
        }
        #content{
        	border: 1px solid black;
        	display: flex;
        	align-items: center;
        	justify-content: center;
        	flex-direction: column;
        }
</style>
<body>
    <section class="section">
        <aside class="aside">
            <nav>
                <ul>
                    <li>*내정보 확인하기</li>
                    <li><a id="editProfileLink">-회원정보 수정</a></li>
                    <li><a id="deleteProfileLink">-회원탈퇴</a></li>
                    <li><a id="getOrderList">*주문내역조회</a></li>
                    <li><a id="getRecentProduct">*최근 본 상품</a></li>
                    <li>*문의내역</li>
                    <li><a id="getQNAList">-상품문의 내역</a></li>
                    <li><a id="getPQNAList">-1:1문의 내역</a></li>
                    <li><a href="">-나문희</a></li>
                </ul>
            </nav>
        </aside>
        <article id="article">
           <div id="content" style="width: 1420px; height: 800px; margin-left:20px;">
           	
           </div>
        </article>
   	 </section>
   	 <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript"> 
    // loginMember 변수를 JavaScript 변수로 할당
    
    

    $("#editProfileLink").click(e => {
        $.get("<%=request.getContextPath()%>/MyPage/memberupdate.do")
            .done(data => {
                $("#content").html(data);
            });
    });

    $("#deleteProfileLink").click(e => {
        $.get("<%=request.getContextPath()%>/MyPage/memberdelete.do")
            .done(data => {
                $("#content").html(data);
            });
    });

    $("#getOrderList").click(e => {
        $.post("<%=request.getContextPath()%>/MyPage/getOrderList.do?MemberId=<%=MemberId%>")
            .done(data => {
                $("#content").html(data);
            });
            
    });
</script>
</body>

<footer>

</footer>
</html>