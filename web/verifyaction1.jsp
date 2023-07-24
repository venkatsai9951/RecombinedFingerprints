<%@page import="com.kk.fingerprint.action.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    String uid = request.getParameter("uid");
    String uname = request.getParameter("uname");
    String fid = request.getParameter("fid");
    String fname = request.getParameter("fname");
    String pkey = request.getParameter("pkey");
    String finger = request.getParameter("finger");
    String ibcode = null;

    System.out.println("The Finger Print NAme is " + finger);
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    Statement st1 = null;
    ResultSet rs1 = null;
    Statement st3 = null;
    ResultSet rs3 = null;
    try {
        /*Binary Conversion*/
        byte[] bytes = finger.getBytes();
        StringBuilder binary = new StringBuilder();
        for (byte b : bytes) {
            int val = b;
            for (int i = 0; i < 8; i++) {
                binary.append((val & 128) == 0 ? 0 : 1);
                val <<= 1;
            }
            binary.append(' ');
        }
        ibcode = binary.toString();
        /*End*/
        con = Database.getConnection();
        st = con.createStatement();
        st1 = con.createStatement();
        rs = st.executeQuery("select * from upload where fid='" + fid + "' AND filename ='" + fname + "'");
        if (rs.next()) {
            rs1 = st1.executeQuery("select * from reg where email='" + rs.getString("uemail") + "'");
            if (rs1.next()) {
                if ((rs1.getString("ibcode")).equals(pkey)) {
                    st3 = con.createStatement();
                    rs3 = st3.executeQuery("select * from reg where uid='" + uid + "' AND ibcode='" + ibcode + "' AND ifname='" + finger + "'");
                    if (rs3.next()) {
                        session.setAttribute("pkey", pkey);
                        response.sendRedirect("verifyaction.jsp");
                    } else {
                        response.sendRedirect("verify.jsp?msgg=failed");
                    }
                } else {
                    response.sendRedirect("verify.jsp?msg1=failed");
                }
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>