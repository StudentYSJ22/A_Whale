<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.nbp.product.review.model.DTO.Review" %>
<%
	String pageBar=(String)request.getAttribute("ajaxPageBar");
	List<Review> reviews = (List<Review>)request.getAttribute("ajaxReviews");
%>

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
          
          	<%if(!reviews.isEmpty()){ 
          		for(Review r:reviews){%>
              <tr class="review-detail">
                  <td><%=r.getReviewNo() %></td>
                  <td><%=r.getReviewTitle()%></td>
                  <td><%=r.getMemberId() %></td>
                  <td><%=r.getReviewEnrollDate() %></td>
              </tr>
              <tr class="review-content">
                  <td colspan='1' style="padding:30px;">
                      <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 1" width="200">
                      <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 1" width="200">
                  </td>
                      <td colspan='4' style="padding:30px;">
                      <%=r.getReviewContent()%>
                  </td>
              </tr>
           <%}
           }%>
          </tbody>
      </table>
    		<%=pageBar%>
           
