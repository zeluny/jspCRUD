<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="connect.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<a href="forminsert.html" class="btn btn-info" role="button">เพิ่มข้อมูล</a>
<table class="table table-hover">
<tr>
<td>userid</td>
<td>username</td>
<td>password</td>
<td>Name</td>
<td>Lastname</td>
<td>E-mail</td>
<td>Age</td>
<td>Tel</td>
<td>Sex</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, id, pass);
statement=connection.createStatement();
String sql ="select * from tb_member";
resultSet = statement.executeQuery(sql);
int i=1;
while(resultSet.next()){
%>
<tr>
<td><%=i%></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("tel") %></td>
<td><%=resultSet.getString("sex") %></td>
</tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>

</html>



