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
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <!-- Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#blah')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </head>
    <body>
        <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Registration Sucessfully');</script>
        <%
            }
            if (request.getParameter("msgg") != null) {
        %>
        <script>alert('Registration Failed');</script>
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
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <div class="container">
            <div class="row">
                <div class="box" style="height: 650px;">
                    <!--To do you work-->
                    <div style="border: 1px solid white;height: 610px;border-top-width: 20px;border-bottom-width: 10px">
                        <center><h3 style="text-transform: uppercase">Registration Form</h3></center><br />
                        <form style="margin-left: 380px;width: 700px;float: left" action="Reg" method="post" enctype="multipart/form-data">
                            <label style="font-size: 20px">Name </label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="uname" style="width: 250px;margin-left: 70px"/><br /><br />
                            <label style="font-size: 20px">Password </label>&nbsp;&nbsp;&nbsp;<input type="password" name="pass" style="width: 250px;margin-left: 38px;"/><br /><br />
                            <label style="font-size: 20px">Email </label>&nbsp;&nbsp;&nbsp;<input type="text" name="email" style="width: 250px;margin-left: 77px;"/><br /><br />
                            <label style="font-size: 20px">Gender </label>&nbsp;&nbsp;&nbsp;
                            <select name="gender" style="margin-left: 57px;width: 150px;height: 30px;">
                                <option selected="">Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select><br /><br />
                            <label style="font-size: 20px">Role </label>&nbsp;&nbsp;&nbsp;
                            <select name="role" style="margin-left: 86px;width: 150px;height: 30px;">
                                <option selected="">Select</option>
                                <option value="Merchant">Merchant</option>
                                <option value="Buyer">Buyer</option>
                            </select><br /><br />
                            <label style="font-size: 20px">Mobile </label>&nbsp;&nbsp;&nbsp;<input type="text" name="mob" style="width: 250px;margin-left: 65px;"/><br /><br />
                            <label style="font-size: 20px">Location </label>&nbsp;&nbsp;&nbsp;<input type="text" name="loc" style="width: 250px;margin-left: 47px;"/><br /><br />
                            <label style="font-size: 20px">Finger Print </label>&nbsp;&nbsp;&nbsp;<input type="file"  name="file" onchange="readURL(this);"  style="margin-left: 143px;"/><br /><br />
                            <div style="float: right;width: 250px;height: 250px;margin-right: 20px;margin-top: -300px;">
                                <center><h4>Finger Print Preview</h4></center>
                                <center><img id="blah" src="img/check.png" alt="Preview" width="150" height="200" /></center>
                            </div>
                            <input type="submit" value="Submit" style="width: 100px;height: 32px;background: white;border: none;color: black;border-color: black;margin-left: 90px"/>&nbsp;&nbsp;
                            <input type="reset"   value="Reset" style="width: 100px;height: 32px;background: white;border: none;color: black;border-color: black"/>
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

