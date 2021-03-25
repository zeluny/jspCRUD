<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%
String  username=request.getParameter("username");
session.setAttribute("username", username);	
session.putValue(" username", username);
String password=request.getParameter("password");
String sql ="select * from member where username='"+ username+"' and password='"+password+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
     String struserid = resultSet.getString("userid");
    String strusername = resultSet.getString("username");
	String strpassword = resultSet.getString("password");
    String strauthors = resultSet.getString("authors");
    session.setAttribute("struserid",struserid);	
	session.setAttribute("strusername",strusername);	
	session.setAttribute("strpassword",strpassword);
    session.setAttribute("strauthors",strauthors);
}
%>
<%

	String strusername = String.valueOf(session.getAttribute("strusername"));
	String strpassword = String.valueOf(session.getAttribute("strpassword"));
	String strauthors = String.valueOf(session.getAttribute("strauthors"));
	String.valueOf(session.getAttribute("struserid"));

    if(strauthors.equals("admin")){ 
         %>
<script>
window.location.replace("select.jsp");
</script>
 <%
    }

    if(strauthors.equals("member")){
        
        %>
<script>
window.location.replace("select.jsp");
</script>
 <%
    }

    else{
    out.println("Please <a href='index.jsp'>Login</a> to continue.");
}
	%>           
</body>
</html>
</body>
</html>