<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.nbp.notice.model.dto.Notice, java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/common/subHeader.jsp" %>
<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>


<style>
	*{
		list-style: none;
	}
	a{
		text-decoration: none;
	}
	.notice{
        height: 100px;
        align-content: center;
        text-align: center;
        font-weight: 1000;
    }
    .container{
        margin: 0 10% 0 10%;
        font-size: 13px;
        
    }
    .notice_title{
        display: flex;
        text-align: center;
        justify-content: space-evenly;
        border-top: 0.5px solid rgb(52, 52, 204);
        border-bottom: 0.5px solid rgb(52, 52, 204);
        
    }
    .notice_title div{
        margin: 15px 10px 15px 10px;
    }
    
    .notice_content{
        
        display: flex;
        justify-content: space-evenly;
        border-bottom: 0.5px solid rgb(202, 202, 254);
    }
    .notice_content div{
        margin: 12px 10px 12px 10px;
    }
    
    .notice_no{
        width: 10%;
        text-align: center;
    }
    .notice_name{
        width: 50%;
    }
    .notice_writer{
        width: 20%; 
        text-align: center;
    }
    .notice_date{
        width: 20%; 
        text-align: center;
    }
    .pagebar{
        text-align: center;
        margin-top: 50px;
    }
    .pagebar ul{
    	display: flex;
    	justify-content:center;
    }
    .pagebar li{
    	margin:0 10px;
    }
</style>
<body>
    <section>
        <div>
            <div class="notice">
                N O T I C E
            </div>
        </div>
        
        
        <div class="container">
            <div class="notice_title">
                <div style="width: 10%;"><strong>번호</strong></div>
                <div style="width: 50%;"><strong>제목</strong></div>
                <div style="width: 20%;"><strong>작성자</strong></div>
                <div  style="width: 20%;"><strong>작성일</strong></div>
            </div>
            <div class="notice_content">
            <%if(notices.isEmpty()) {%>
            	<div>
            		조회된 공지사항이 없습니다
            	</div>
            <%
            }else{
                 for(Notice n:notices){%>
            	
            	<div  class="notice_no">
            		<%=n.getNoticeNo() %>
            	</div>
                <div class="notice_name">
                	<a href="<%=request.getContextPath()%>/notice/noticeview.do?no=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle() %></a>
                </div>
                <%-- <div><%if(i.getFilePath()!=null){%>
                	<img src="<%=request.getContextPath() %>/images/file.png" width="25"">
                	<%}else{ %>
                	없음
                	<%} %>
                </div> --%>
                <div class="notice_writer">
                	<%=n.getNoticeWriter() %>
                </div>
                <div class="notice_date">
                	<%=new SimpleDateFormat("yyyy-MM-dd").format(n.getNoticeEnrollDate()) %>
                </div>
           	
                <%}
              }%>
            </div>
        </div>
        <!-- 관리자 페이지에서 쓸수 있게 하기 -->
<%--         <button class="" onclick="location.assign('<%=request.getContextPath()%>/inform/informwrite.do')">글쓰기</button>
 --%>

        <div class="pagebar" >
        	<div>
        		<%=request.getAttribute("pageBar") %>
        	</div>
        	
        </div>


    </section>
</body>
</html>