<%@page import="java.sql.ResultSet"%>
<%@page import="com.kk.fingerprint.action.Database"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    int status = Integer.parseInt(request.getParameter("status"));

    try {
        con = Database.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from reg where email='" + name + "' AND pass='" + pass + "' AND role='Merchant'");
                    if (rs.next()) {
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("name", rs.getString("name"));
                        session.setAttribute("role", rs.getString("role"));
                        session.setAttribute("uid", rs.getString("uid"));
                        response.sendRedirect("mhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("merchant.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {
                    rs = st.executeQuery("select * from reg where email='" + name + "' AND pass='" + pass + "' AND role='Buyer'");
                    if (rs.next()) {
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("name", rs.getString("name"));
                        session.setAttribute("role", rs.getString("role"));
                        session.setAttribute("uid", rs.getString("uid"));
                        response.sendRedirect("bhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("buyer.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 3:
                try {
                    if (name.equalsIgnoreCase("Txmonitor") && pass.equalsIgnoreCase("Txmonitor")) {
                        response.sendRedirect("thome.jsp?msg=success");
                    } else {
                        response.sendRedirect("txmonitor.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 4:
                try {
                    if (name.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("Admin")) {
                        response.sendRedirect("ahome.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>