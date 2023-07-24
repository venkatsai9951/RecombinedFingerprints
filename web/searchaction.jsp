<%-- 
    Document   : txmonitor
    Created on : Sep 7, 2015, 11:45:00 AM
    Author     : java2
--%>

<%@page import="com.kk.fingerprint.action.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Privacy-Preserving P2P Multimedia Distribution</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/business-casual.css" rel="stylesheet">
        <!-- Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div class="brand">Improved Privacy-Preserving P2P Multimedia
            Distribution <br />Based on Recombined Fingerprints</div>
        <!-- Navigation -->
        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                    <a class="navbar-brand" href="index.html">Business Casual</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="bhome.jsp">Home</a>
                        </li>
                        <li>
                            <a href="bprofile.jsp">Profile</a>
                        </li>
                        <li>
                            <a href="search.jsp">Search</a>
                        </li>
                        <li>
                            <a href="fdownload.jsp">File Download</a>
                        </li>
                        <li>
                            <a href="index.html">Logout</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <%
                        String uname = session.getAttribute("name").toString();
                        String search = request.getParameter("search");
                        session.setAttribute("search", search);
                    %>
                    <!--To do you work-->
                    <div style="border: 1px solid white;height: 400px;border-top-width: 20px;border-bottom-width: 10px">
                        <center>
                            <h3>Welcome <strong style="color: red"><%=uname%></strong></h3><br /><br />
                            <h4>File List</h4>
                        </center><br />
                        <table style="text-align: center;margin-left: 400px;font-size: 20px;">
                            <%
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = Database.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from upload where filename LIKE '%" + search + "%'");
                                    if (rs.next()) {
                                        do {
                            %>
                            <tr>
                                <td width="200px"><%=rs.getString("filename")%></td>
                                <td><a href="request.jsp?<%=rs.getString("filename")%>_<%=rs.getString("fid")%>_<%=rs.getString("uemail")%>" style="text-decoration: none">Request</a></td>
                            </tr>      
                            <%} while (rs.next());%>
                            <center><a href="search.jsp" style="text-decoration: none">Back</a></center>
                                <%} else {
                                %>
                            <label style="margin-left: 300px;font-size: 18px;color: red">Your search - <label style="color: blue"><%=search%></label>- did not match any documents.</label><br />
                            <label style="margin-left: 300px;font-size: 18px;color: #0000cc">Suggestions:</label><br />
                            <ul style="margin-left: 350px;font-size: 18px;color: #0000cc"><br />
                                <li>Make sure that all words are spelled correctly.</li>
                                <li>Try different keywords.</li>
                                <li>Try more general keywords.</li>
                            </ul>
                            <center><a href="search.jsp" style="text-decoration: none">Back</a></center>
                                <%
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Copyright &copy; 2015-2016
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
