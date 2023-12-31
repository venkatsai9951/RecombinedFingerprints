<%-- 
    Document   : txmonitor
    Created on : Sep 7, 2015, 11:45:00 AM
    Author     : java2
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
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
        <script type = "text/javascript">
            function displayNextImage() {
//                x = (x === images.length - 1) ? 0 : x + 1;
                
//                document.getElementById("img").src = images[x];
                document.getElementById("hin").innerHTML = "Verified Successfully";
                document.getElementById("img").src = document.getElementById("img1").src;
            }

//            function displayPreviousImage() {
//                x = (x <= 0) ? images.length - 1 : x - 1;
//                document.getElementById("img").src = images[x];
//            }

            function startTimer() {
                setInterval(displayNextImage, 10000);
            }
//            var images = [], x = -1;
//            images[0] = "images1.jpg";
//            images[1] = "images1.jpg";
//            images[2] = "images1.jpg";
        </script>
    </head>
    <body onload="startTimer()">
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
                <div class="box" style="height: 500px;">
                    <!--To do you work-->
                    <%
                        String uid = session.getAttribute("uid").toString();
                        String uname = session.getAttribute("name").toString();
                        String fid = session.getAttribute("fid").toString();
                        String fname = session.getAttribute("fname").toString();
                        String pkey = session.getAttribute("pkey").toString();
                    %>
                    <div style="border: 1px solid white;height: 450px;border-top-width: 20px;border-bottom-width: 10px">
                        <center><h3>Verification System </h3></center>
                        <div style="float: left;width: 400px;height: 300px;margin-left: 20px;background: white"><br />
                            <center><h3>User Details</h3></center><br />
                            <label style="margin-left: 50px;">User ID</label><input type="text" readonly="" value="<%=uid%>" name="uid" style="margin-left: 40px"/><br /><br />
                            <label style="margin-left: 50px;">Username</label><input type="text" readonly="" value="<%=uname%>" name="" style="margin-left: 20px"/><br /><br />
                            <label style="margin-left: 50px;">Finger Print</label><img src="fimage.jsp?id=<%=uid%>" width="100" height="100"/>
                        </div>
                        <div style="float: right;width: 400px;height: 300px;margin-left: 50px;background: white"><br />
                            <center><h3>File Details</h3></center><br />
                            <label style="margin-left: 50px;">File ID</label><input type="text" readonly="" value="<%=fid%>" style="margin-left: 35px"/><br /><br />
                            <label style="margin-left: 50px;">File Name</label><input type="text" readonly="" value="<%=fname%>" style="margin-left: 10px"/><br /><br />
                            <label style="margin-left: 50px;">Public Key</label><input type="text" id="pkey" value="<%=pkey%>" readonly="" style="margin-left: 10px"/><br /><br />
                        </div>
                        <div style="width: 260px;height: 300px;margin-left: 460px;">
                            <center>
                                <a href="download.jsp?id=<%=fid%>"><img src="img/processing.gif" id="img" width="258" height="300" alt="verify" style="margin-top: -320px"/></a>
                                <img src="img/download.gif" id="img1" width="1" height="1"/>
                            </center>
                                <center><h5 style="color: red" id="hin"></h5></center>
                        </div>
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
