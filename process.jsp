<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ include file="connect.jsp" %>

<%
   File file;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;

   String filePath = "C:\\xampp\\tomcat\\webapps\\lpc\\images\\";//แก้ได้

   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("tmp/"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax(maxFileSize);
      
      try { 
         List fileItems = upload.parseRequest(request);
         Iterator<FileItem> i = fileItems.iterator();
         
         String db_field_file = null;
         String db_field_user = null;
         String db_field_pass = null;
           String db_field_authors = null;

         while (i.hasNext()) {

            FileItem fi = i.next();

            if (!fi.isFormField()) {
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();

               if (fileName.lastIndexOf("\\") >= 0) {
                  file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
               } else {
                  file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
               }

               fi.write(file);

               db_field_file = fileName;//แก้ได้
            }

        if (fi.isFormField())
            {
               String fieldName = fi.getFieldName();
               String fieldValue = fi.getString();
               if (fieldName.equals("txtusername")) {
                     db_field_user = fieldValue;
                  }
                  else if (fieldName.equals("txtpassword")){
                      db_field_pass = fieldValue;
                  }
                  else if(fieldName.equals("send_authors"))
                  {
                  db_field_authors = fieldValue;
                  }
            }
         }
            PreparedStatement pstatement = null;
              int updateQuery = 0;
         String sql = "INSERT INTO member (username,password,authors,picture) VALUES (?,?,?,?)";
         pstatement = connection.prepareStatement(sql);
          pstatement.setString(1, db_field_user);
         pstatement.setString(2, db_field_pass);
          pstatement.setString(3, db_field_authors);
           pstatement.setString(4, db_field_file);
updateQuery = pstatement.executeUpdate();
             if (updateQuery != 0)  { 
        %>
<script>
window.location.replace("index.jsp");
</script>
  <%
}

      } catch (Exception ex) {

         System.out.println(ex);

      }

   }
%>