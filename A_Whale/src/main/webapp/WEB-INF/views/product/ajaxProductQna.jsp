<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbp.model.DTO.Member" %>     
<%@ page import="java.util.List,com.nbp.product.review.model.DTO.Qna" %>
<%
	String qnaPageBar=(String)request.getAttribute("qnaPageBar"); 
	List<Qna> qnas = (List<Qna>)request.getAttribute("qnas");
%>    

<%
   Member loginMember=(Member)session.getAttribute("loginMember");
%> 
    
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