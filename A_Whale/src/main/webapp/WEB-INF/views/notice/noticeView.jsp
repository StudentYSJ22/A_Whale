<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.nbp.notice.model.dto.Notice,com.nbp.model.DTO.Member, java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/common/subHeader.jsp" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
	
	Notice n = (Notice)request.getAttribute("notice");
	
	/* if (n == null) {
        out.println("<script>alert('공지사항을 찾을 수 없습니다.'); location.href='noticelist.do';</script>");
        return;
    } */
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세내용</title>
</head>
<style>
	.notice{
        height: 100px;
        align-content: center;
        text-align: center;
        font-weight: 1000;
    }

    .notice_detail_container{
        margin: 0 10% 0 10%;
    }
    .notice_detail_title{
        font-size: 16px;
        margin: 15px 15px 15px 20px;
    }
    .row1{
        border-top: 0.5px solid rgb(202, 202, 254);
        border-bottom: 0.5px solid rgb(202, 202, 254);
    }
    .row2{
        font-size: 13px;
        display: flex;
        border-bottom: 0.5px solid rgb(202, 202, 254);
    }
    .row2 div{
        margin: 15px 15px 15px 20px;
    }

    .img_cotainer{
        display: flex;
        justify-content: center; 
        
  
    }
    .img_cotainer img{
        max-width: 100%;
       
    }
    .notice_list{
        margin: 30px 0 50px 20px;
    }
    button{
        background-color: white; 
        width: 60px; 
        border: 0.5px solid black;
    }
</style>
<body>
    <section>
        <div>
            <div class="notice" >
                N O T I C E
            </div>
        </div>


        <div class="notice_detail_container" >
            <div class="row1">
                <div class="notice_detail_title">
                    <strong><%=n.getNoticeTitle() %></strong> 
                </div>
            </div>
            <div class="row2" >
                <div class="notice_detail_writer" > 
                    <%=n.getNoticeWriter() %>
                </div>
                <div class="notice_detail_date" >
                    <%=new SimpleDateFormat("yyyy-MM-dd").format(n.getNoticeEnrollDate()) %>
                </div>
            </div>
            
                
      
            <div>
                <div class="imgcontainer">
                    <div class="notice_detail_img">
                        <div class="img_cotainer" style="margin: 30px;">
                             <img src="<%= request.getContextPath() %>/upload/<%= n.getNoticeImgUrl() %>" alt="" width="400" height="600" style="justify-content:center;">
                        </div>
                        
                    </div>
                </div>
                <div class="" style="margin: 10px; border-bottom: 0.5px solid rgb(202, 202, 254);">
                    <div class="notice_detail_content" style="margin: 20px 20px 80px 20px">
                    <%=n.getNoticeContent() %>
                        
                    </div>
                </div>
            </div>
            <div class="notice_list" >
                <a href="<%=request.getContextPath()%>/notice/noticelist.do"><button >목록</button></a>
            </div>
            <%-- <%if(loginMember!=null &&loginMember.getMemberId().equals("ADMIN")){ %>
                <button class="" onclick="location.assign('<%=request.getContextPath()%>/notice/noticedelete.do')">공지글삭제
     		</button>
             <%} %> --%>
             <%if(loginMember!=null &&loginMember.getMemberId().equals("ADMIN")){ %>
            <div style="margin-top: 20px;">
	            <form action="<%=request.getContextPath()%>/notice/noticedelete.do" method="post">
	                <input type="hidden" name="no" value="<%=n.getNoticeNo()%>">
	                <button type="submit">삭제</button>
	            </form>
        	</div>
        	<%} %>
        </div>
    </section>
</body>
</html>