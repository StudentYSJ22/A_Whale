<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.nbp.model.DTO.Member" %> 
<%
    session = request.getSession(false);
    Member loginMember = null;
    String loginId="";
    if (session != null) {
        loginMember = (Member) session.getAttribute("loginMember");
    	loginId=loginMember.getMemberId();
    }
%>