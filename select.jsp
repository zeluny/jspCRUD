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

    String strauthors = String.valueOf(session.getAttribute("strauthors"));
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
<a href="logout.jsp" class="btn btn-danger" role="button">ออกจากระบบ</a>
<table class="table table-hover">
<tr>
<td>ID</td>
<td>รหัสประจำตัวนักศึกษา</td>
<td>Username</td>
<td>Password</td>
<td>คำนำหน้า</td>
<td>ชื่อ</td>
<td>นามสกุล</td>
<td>อายุ</td>
<td>เพศ</td>
<td>เบอร์โทร</td>
<td>E-mail</td>
<td>ที่อยู่</td>
<%
    if(strauthors.equals("admin")){
%>
    <td></td>
    <td></td>
<%
    }
%>

</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, id, pass);
statement=connection.createStatement();
String sql ="select * from student";
resultSet = statement.executeQuery(sql);
int i=1;
while(resultSet.next()){
%>
<tr>
<td><%=i%></td>
<td><%=resultSet.getString("id_student") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
<td><%=resultSet.getString("prename") %></td>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("mobile") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("address") %></td>

 <%
    if(strauthors.equals("admin")){
%>

 <form action="insert.jsp?userid=<%=resultSet.getString("id_rec") %>" method="POST">
<td><button type="submit" name="userid" class="btn btn-danger">Delete</button></a></td>
</form>
<form action="edit.jsp?userid=<%=resultSet.getString("id_rec") %>" method="POST">
<td><button type="submit" class="btn btn-warning">EDIT</button></td>
</form>
 <%
    }
%>
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



