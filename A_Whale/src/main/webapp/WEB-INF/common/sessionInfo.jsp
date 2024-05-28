<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.nbp.model.DTO.Member" %> 
<%
    HttpSession session1 = request.getSession(false);
    Member loginMember = null;
    if (session != null) {
        loginMember = (Member) session.getAttribute("loginMember");
    }
%>