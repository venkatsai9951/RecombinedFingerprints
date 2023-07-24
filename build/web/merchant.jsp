<%-- 
    Document   : merchant
    Created on : Sep 7, 2015, 11:44:28 AM
    Author     : java2
--%>

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
        <%
           if (request.getParameter("msgg") != null) {
        %>
        <script>alert('Please Enter Correct username and Password');</script>
        <%
            }
        %>
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
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a href="merchant.jsp">Merchant</a>
                        </li>
                        <li>
                            <a href="buyer.jsp">Buyer</a>
                        </li>
                        <li>
                            <a href="txmonitor.jsp">Tx Monitor</a>
                        </li>
                        <li>
                            <a href="admin.jsp">Admin</a>
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
                        <center><h3>Merchant Login</h3></center><br />
                        <form style="margin-left: 380px" action="loginaction.jsp" method="post">
                            <label style="font-size: 20px">Username </label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="name" style="width: 250px;"/><br /><br />
                            <label style="font-size: 20px">Password </label>&nbsp;&nbsp;&nbsp;<input type="password" name="pass" style="width: 250px;margin-left: 8px;"/><br /><br />
                            <input type="hidden" value="1" name="status" />
                            <input type="submit" value="Submit" style="width: 100px;height: 32px;background: white;border: none;color: black;border-color: black;margin-left: 90px"/>&nbsp;&nbsp;
                            <input type="reset"   value="Reset" style="width: 100px;height: 32px;background: white;border: none;color: black;border-color: black"/><br /><br />
                            <label style="margin-left: 200px;">New User</label>&nbsp;&nbsp;<a href="reg.jsp"><small>click here</small></a>
                        </form>
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

