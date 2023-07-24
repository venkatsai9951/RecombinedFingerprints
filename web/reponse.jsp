<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.kk.fingerprint.action.mail_Senddd"%>
<%@page import="com.kk.fingerprint.action.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String msg = null, process = "Response";
    String uname = session.getAttribute("name").toString();
    String role = session.getAttribute("role").toString();
    Date date = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("YYYY:mm:dd HH:mm:ss");
    String now = sf.format(date);
    String[] data = request.getQueryString().split("_");
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Statement st2 = null;
    ResultSet rs = null;
    try {
        con = Database.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from reg where email='" + data[1] + "'");
        if (rs.next()) {
            st2 = con.createStatement();
            int j = st2.executeUpdate("update request set status='Yes' where fid='"+data[0]+
            "' AND uemail='"+data[2]+"'");
           if (j != 0) {
                mail_Senddd m = new mail_Senddd();
                msg = "File ID :" + data[0] + "\n\nPublic Key :" + rs.getString("ibcode");
                boolean f = m.sendMail(msg, "KK", data[2]);
                if (f) {
                    st1 = con.createStatement();
                    int i = st1.executeUpdate("insert into history(uname, role, process, ptime)values('" + uname + "','" + role + "','" + process + "','" + now + "')");
                    if (i != 0) {
                        response.sendRedirect("frequest.jsp?msg=success");
                    }
                }
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>