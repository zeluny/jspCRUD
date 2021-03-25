<%@page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
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
	<%	
		String userid =request.getParameter("userid");
		String sql = "SELECT * FROM  student WHERE id_rec= "+userid  ;
		resultSet = statement.executeQuery(sql);
		if(resultSet != null) {
			resultSet.next();
		%>
	<form name="frmUpdate" method="post" action="insert.jsp?editid=<%=resultSet.getString("id_rec")%>">	
		<h1>Update Form <h1>
			<table width="428" border="1">	
			<tr>
				<th width="181">
				<div align="left">userid</div></th>
				<td width="231"><%=resultSet.getString("id_rec")%></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">รหัสประจำตัวนักศึกษา</div></th>
				<td><input class="form-control" type="text" name="id_student" size="20" value="<%=resultSet.getString("id_student")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Username </div></th>
				<td><input class="form-control" type="text" name="username" size="20" value="<%=resultSet.getString("username")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Password </div></th>
				<td><input class="form-control" type="password" name="password" size="20" value="<%=resultSet.getString("password")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">คำนำหน้า</div></th>
				<td><input class="form-control" type="text" name="prename" size="20" value="<%=resultSet.getString("prename")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">ชื่อ </div></th>
				<td><input class="form-control" type="text" name="firstname" size="20" value="<%=resultSet.getString("firstname")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">นามสกุล </div></th>
				<td><input class="form-control" type="text" name="lastname" size="20" value="<%=resultSet.getString("lastname")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">อายุ </div></th>
				<td><input class="form-control" type="text" name="age" size="20" value="<%=resultSet.getString("age")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">เพศ </div></th>
				<td><input class="form-control" type="text" name="gender" size="20" value="<%=resultSet.getString("gender")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">เบอร์โทรศัพท์ </div></th>
				<td><input class="form-control" type="text" name="mobile" size="20" value="<%=resultSet.getString("mobile")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">E-mail </div></th>
				<td><input class="form-control" type="text" name="email" size="20" maxlength="10" value="<%=resultSet.getString("email")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Address </div></th>
				<td><input class="form-control" type="text" name="address" size="20" value="<%=resultSet.getString("address")%>"></td>
			</tr>

			</table> 
		<input type="submit" value="Save" class="btn btn-info">
		</form> 
		
		<% 
		}
	%>
	</div>
</body>
</html>