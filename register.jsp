<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%
   request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<%
              String id_student = request.getParameter("TXTid_student");
              String prename = request.getParameter("TXTprename");
              String firstname = request.getParameter("TXTfirstname");
              String lastname = request.getParameter("TXTlastname");
              String age = request.getParameter("TXTage");
              String gender = request.getParameter("TXTgender");
              String address = request.getParameter("TXTaddress");
              String mobile = request.getParameter("TXTmobile");
              String email = request.getParameter("TXTemail");
              String img_name = request.getParameter("TXTimg_name");
              String img_path = request.getParameter("TXTimg_path");
              String username = request.getParameter("TXTusername");
              String password = request.getParameter("TXTpassword");
                  PreparedStatement pstatement = null;
                  int updateQuery = 0;
                      try {
          String sql = "insert into student(id_student,prename,firstname,lastname,age,gender,address,mobile,email,img_name,img_path,username,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
          pstatement = connection.prepareStatement(sql);
          pstatement.setString(1, id_student);
          pstatement.setString(2, prename);
          pstatement.setString(3, firstname);
          pstatement.setString(4, lastname);
          pstatement.setString(5, age);
          pstatement.setString(6, gender);
          pstatement.setString(7, address);
          pstatement.setString(8, mobile);
          pstatement.setString(9, email);
          pstatement.setString(10, img_name);
          pstatement.setString(11, img_path);
          pstatement.setString(12, username);
          pstatement.setString(13, password);

          updateQuery = pstatement.executeUpdate();
          if (updateQuery != 0)  { 
              %>
          <script>
          window.location.replace("index.jsp");
          </script>
            <%
          }
          } 
          catch (Exception ex){
          out.println("Unable to connect to batabase.");
          }finally {
          // close all the connections.
          pstatement.close();
          }
%>

</body>
</html>
</body>
</html>