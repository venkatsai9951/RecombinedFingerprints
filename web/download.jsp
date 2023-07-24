<%-- 
    Document   : Image
    Created on : Aug 7, 2015, 1:27:26 PM
    Author     : java2
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kk.fingerprint.action.Database"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>%>

<%@ page import="java.io.*"%>
<html>
    <body>
        <%
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("YYYY:mm:dd HH:mm:ss");
            String now = sf.format(date);
            String process = "Download";
            String role = session.getAttribute("role").toString();
            String name = session.getAttribute("name").toString();
            OutputStream o = null;
            String id = request.getParameter("id");
            String fileName = null;
            System.out.println("The Image Unique ID " + id);
            Blob image = null;
            Connection con = null;
            byte[] imgData = null;
            Statement stmt = null;
            Statement stmt1 = null;
            ResultSet rs = null;
            try {
                con = Database.getConnection();
                stmt = con.createStatement();
                stmt1 = con.createStatement();
                rs = stmt.executeQuery("select * from upload where fid = '" + id + "'");
                if (rs.next()) {
                    image = rs.getBlob("file");
                    imgData = image.getBytes(1, (int) image.length());
                    fileName = rs.getString("filename");
                } else {
                    out.println("Display Blob Example");
                    out.println("image not found for given id>");
                    return;
                }
                // display the image
                String fileType = fileName.substring(fileName.indexOf(".") + 1, fileName.length());

                if (fileType.trim().equalsIgnoreCase("txt")) {
                    response.setContentType("text/plain");
                } else if (fileType.trim().equalsIgnoreCase("doc") || fileType.trim().equalsIgnoreCase("docx")) {
                    response.setContentType("application/msword");
                } else if (fileType.trim().equalsIgnoreCase("xls")) {
                    response.setContentType("application/vnd.ms-excel");
                } else if (fileType.trim().equalsIgnoreCase("pdf")) {
                    response.setContentType("application/pdf");
                } else if (fileType.trim().equalsIgnoreCase("ppt") || fileType.trim().equalsIgnoreCase("pptx")) {
                    response.setContentType("application/ppt");
                } else {
                    response.setContentType("application/octet-stream");
                }
                int i = stmt1.executeUpdate("insert into history(uname, role, process, ptime)values('" + name
                        + "','" + role + "','" + process + "','" + now + "')");
                if (i != 0) {
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                    response.setHeader("cache-control", "no-cache");
                    o = response.getOutputStream();
                    o.write(imgData);
                }
                o.flush();
                o.close();
            } catch (Exception e) {
                out.println("Unable To Display image");
                out.println("Image Display Error=" + e.getMessage());
                return;
            } finally {
            }
        %>
        <video>
            <video src="<%=o%>" />
        </video>
    </body>

</html>
