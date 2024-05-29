<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, com.nbp.model.DTO.Member,java.text.SimpleDateFormat, com.nbp.notice.model.dto.Notice" %>

<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
	Member loginMember =(Member) (Member)session.getAttribute("loginMember");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
	<section id="noticeSection" style="width:100%; margin:20px 0px 20px 50px;">
       <div>
           <div>공지사항 관리</div>
       </div>
       <div>
       		<button id="noticeSearchButton">공지글 조회</button>
       	 	<div id="searchContainer" ></div>
       </div>
       

       <div>
        	<button id="noticeWriteButton"> 공지사항 작성</button> 
       </div>
       <div id="writeContainer" class="form-container" style="border:1px solid black;">
	       <form action="<%=request.getContextPath() %>/notice/noticewriteend.do" 
	        method="post" enctype="multipart/form-data">
	            <div class="row1" >
	                <div class="row2" >
	                    제목
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="title" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    작성자
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="writer" value="<%=loginMember.getMemberId()%>" readOnly> 
	
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    첨부파일
	                </div>
	                <div>
	                    <input class="form-control" type="file" name="upfile">
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
<script >
	$(document).ready(function(){
	    $("#noticeSearchButton").click(function(){
	    	$("#searchContainer").toggle();
	        $.ajax({
	            url: "<%=request.getContextPath()%>/notice/noticelist.do?admin=true",
	            method: "GET",
	            success: function(data) {
	                var container = $(data).find(".container");
	                var styles = `
	                    * { list-style: none; }
	                    a { text-decoration: none; }
	                    .container { margin: 0 10% 0 10%; font-size: 13px; }
	                    .notice_title { display: flex; text-align: center; justify-content: space-evenly; border: 1px solid black;border-bottom:none; }
	                    .notice_title > div { align-content: center; margin: 15px 10px 15px 10px; }
	                    .notice_content { justify-content: space-evenly; border: 1px solid black;}
	                    .notice_content div { margin: 8px 10px 12px 10px; }
	                    .notice_no { width: 10%; text-align: center; }
	                    .notice_name { width: 50%; }
	                    .notice_writer { width: 20%; text-align: center; }
	                    .notice_date { width: 20%; text-align: center; }
	                `;
	                $("#searchContainer").html('<style>' + styles + '</style>' + container.html());
	            },
	            error: function(xhr, status, error) {
	                console.error("Failed to fetch notices: ", status, error);
	            }
	        });
	    });
	});
	
	$("#noticeWriteButton").click(function(){
        $("#writeContainer").toggle(); // 클릭 시 폼 컨테이너 표시/숨김 전환
    });
	</script>
</body>
</html>