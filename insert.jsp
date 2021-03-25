<%@page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<body>
<%  if (request.getParameter("btnadd")!=null)
       {
		String id_student = request.getParameter("id_student");
		String prename = request.getParameter("prename");
              String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
              String age = request.getParameter("age");
		String gender = request.getParameter("gender");
              String mobile = request.getParameter("mobile");
              String email = request.getParameter("email");
              String address = request.getParameter("address");
              String username = request.getParameter("username");
              String password = request.getParameter("password");
        PreparedStatement pstatement = null;
        int updateQuery = 0;
            try {
String sql = "insert into student(id_student,prename,firstname,lastname,age,gender,mobile,email,address,username,password) values(?,?,?,?,?,?,?,?,?,?,?)";
pstatement = connection.prepareStatement(sql);
pstatement.setString(1, id_student);
pstatement.setString(2, prename);
pstatement.setString(3, firstname);
pstatement.setString(4, lastname);
pstatement.setString(5, age);
pstatement.setString(6, gender);
pstatement.setString(7, mobile);
pstatement.setString(8, email);
pstatement.setString(9, address);
pstatement.setString(10, username);
pstatement.setString(11, password);
updateQuery = pstatement.executeUpdate();

if (updateQuery != 0)  { 
    %>
<script>
window.location.replace("select.jsp");
</script>
  <%
}
}
catch (Exception ex){
out.println("Unable to connect to database.");
}finally {
// close all the connections.
pstatement.close();
}
       }
       if (request.getParameter("userid")!=null)
       {
String userid =request.getParameter("userid");
PreparedStatement pstatement = null; 
String sql ="DELETE FROM student WHERE id_rec= "+userid  ;
pstatement = connection.prepareStatement(sql);
int updateQuery = pstatement.executeUpdate(); 
 if (updateQuery != 0)  { 
    %>
<script>
window.location.replace("select.jsp");
</script>
  <%
}
       }
if (request.getParameter("editid")!=null)
       {
              String userid = request.getParameter("editid");
		String id_student = request.getParameter("id_student");
		String username = request.getParameter("username");
              String password = request.getParameter("password");
		String prename = request.getParameter("prename");
              String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
              String age = request.getParameter("age");
		String gender = request.getParameter("gender");
              String mobile = request.getParameter("mobile");
              String email = request.getParameter("email");
              String address = request.getParameter("address");
        PreparedStatement pstatement = null;
           int updateQuery = 0;
        String sql="Update student set id_student=?,username=?,password=?,prename=?,firstname=?,lastname=?,age=?,gender=?,mobile=?,email=?,address=? WHERE student.id_rec="+userid;
	 pstatement = connection.prepareStatement(sql);
pstatement.setString(1, id_student);
pstatement.setString(2, username);
pstatement.setString(3, password);
pstatement.setString(4, prename);
pstatement.setString(5, firstname);
pstatement.setString(6, lastname);
pstatement.setString(7, age);
pstatement.setString(8, gender);
pstatement.setString(9, mobile);
pstatement.setString(10, email);
pstatement.setString(11, address);
updateQuery = pstatement.executeUpdate();
if (updateQuery != 0)  {  %>
<script>
window.location.replace("select.jsp");
</script>
 <%
}
       }
       
%>

</body>
</html>