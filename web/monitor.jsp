<%-- 
    Document   : txmonitor
    Created on : Sep 7, 2015, 11:45:00 AM
    Author     : java2
--%>

<%@page import="com.kk.fingerprint.action.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                            <a href="thome.jsp">Home</a>
                        </li>
                        <li>
                            <a href="monitor.jsp">Monitor History</a>
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
                    <!--To do you work-->
                    <div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">
                        <center><h3>File Details</h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 100px">
                            <tr>
                                <th width="5%" style="text-align: center">Username</th>
                                <th width="5%" style="text-align: center">Role</th>
                                <th width="5%" style="text-align: center">Process</th>
                                <th width="5%" style="text-align: center">Process Time</th>
                            </tr>
                            <tr>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = Database.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from history");
                                        while (rs.next()) {%>
                                <td><%=rs.getString("uname")%></td>
                                <td><%=rs.getString("role")%></td>
                                <td><%=rs.getString("process")%></td>
                                <td><%=rs.getString("ptime")%></td>
                            </tr>
                            <%}
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
