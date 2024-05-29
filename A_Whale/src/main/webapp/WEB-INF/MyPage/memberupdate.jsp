<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="com.nbp.model.DTO.Member" %> 
    <%@ page import="com.nbp.model.DAO.MemberDAO" %>   
<%
   Member loginMember=(Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://webfontworld.github.io/kopus/KoPubWorldDotum.css" rel="stylesheet">
<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


<body>

	<style>
	body{
		font-family:KoPubWorldDotum;
	}
    .userInput{
        margin-top: 50px;
    }
    #inputContainer{
        margin-right: 20px;
    	margin: 0;   
    }
    .userInput button{
    	margin-left:20px;
    }
    body{
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }
    .userInput>form>*{
        margin: 10px;
    }

</style>

<p class="userInput">회원정보수정</p>

    <div id="inputContainer">
        <div class="userInput">
            <form action="<%=request.getContextPath() %>/MyPage/updateMember.do" method="post">
                아이디 <input type="text" name="userId" id="userId" value="<%=loginMember.getMemberId() %>" readonly><span style="font-size:10px;">*변경불가</span><br>
                    
                패스워드 <input type="password" name="userPw" id="userPw"><br>
                    
                이메일 <input type="email" name="userEm" id="userEm" value="<%=loginMember.getMemberEmail() %>" readonly><span style="font-size:10px;">*변경불가 변경을 원하시면 관리자에게 문의하세요.</span><br>
                    
                주소 <input type="text" name="userAdr" id="userAdr" value="<%=loginMember.getMemberAdr() %>"><br>
                    
                전화번호 <input type="text" name="userPh" id="userPh" value="<%=loginMember.getMemberPhone() %>"><br>

                <input id="result" type="submit" value="적용하기"> <input type="reset" value="뒤로가기" style="margin-left:10px;">
            </form>
            
        </div>
    </div>
</body>
</html>