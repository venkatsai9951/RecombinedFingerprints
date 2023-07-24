<%@page import="java.sql.ResultSet"%>
<%@page import="com.kk.fingerprint.action.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String uname = session.getAttribute("name").toString();
    String uemail = session.getAttribute("email").toString();
    String role = session.getAttribute("role").toString();
    
    String[] data = request.getQueryString().split("_");
    Date date = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("YYYY:mm:dd HH:mm:ss");
    String now = sf.format(date);
    String process = "Request";
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    try {
        con = Database.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from request where fid='" + data[1] + "' AND uemail ='" + uemail + "'");
        if (rs.next()) {
            response.sendRedirect("search.jsp?msg1=success");
        } else {
            int i = st.executeUpdate("insert into request (fid, fname, uname, uemail, owner, rtime, status) values ('" + data[1] + "','" + data[0] + "','" + uname + "','" + uemail + "','"+data[2]+"','" + now + "','No')");
            if (i != 0) {
                st1 = con.createStatement();
                int j = st1.executeUpdate("insert into history (uname, role, process, ptime) values ('" + uname + "','" + role + "','" + process + "','" + now + "')");
                if (j != 0) {
                    response.sendRedirect("search.jsp?msg=success");
                }
            } else {
                response.sendRedirect("searchaction.jsp?msgg=failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    
%>