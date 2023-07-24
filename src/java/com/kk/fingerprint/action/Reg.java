/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kk.fingerprint.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Reg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con = null;
            PreparedStatement pstm = null;
            Statement st = null;
            String uid = null;
            String name = null;
            String pass = null;
            String email = null;
            String gender = null;
            String role = null;
            String mob = null;
            String loc = null;
            /* TODO output your page here. You may use following sample code. */
            boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
            if (!isMultipartContent) {
                return;
            }
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List<FileItem> fields = upload.parseRequest(request);
                Iterator<FileItem> it = fields.iterator();
                if (!it.hasNext()) {
                    return;
                }
                while (it.hasNext()) {
                    FileItem fileItem = it.next();

                    if (fileItem.getFieldName().equals("uname")) {
                        name = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("pass")) {
                        pass = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("email")) {
                        email = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("gender")) {
                        gender = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("role")) {
                        role = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("mob")) {
                        mob = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("loc")) {
                        loc = fileItem.getString();
                    } else {
                    }
                    boolean isFormField = fileItem.isFormField();
                    if (isFormField) {
                    } else {
                        uid = UUID.randomUUID().toString().substring(0, 6);
                        /*Binary Conversion*/
                        byte[] bytes = fileItem.getName().getBytes();
                        StringBuilder binary = new StringBuilder();
                        for (byte b : bytes) {
                            int val = b;
                            for (int i = 0; i < 8; i++) {
                                binary.append((val & 128) == 0 ? 0 : 1);
                                val <<= 1;
                            }
                            binary.append(' ');
                        }
                        String ibcode = binary.toString();
                        System.out.println("The Binary Code in Reg Servlet " + ibcode);
                        /*End*/
                        try {
                            con = Database.getConnection();
                            pstm = con.prepareStatement("insert into reg(uid, name, pass, email,gender, role, mob, loc, ifinger, ifname, ibcode)values(?,?,?,?,?,?,?,?,?,?,?)");
                            pstm.setString(1, uid);
                            pstm.setString(2, name);
                            pstm.setString(3, pass);
                            pstm.setString(4, email);
                            pstm.setString(5, gender);
                            pstm.setString(6, role);
                            pstm.setString(7, mob);
                            pstm.setString(8, loc);
                            pstm.setBinaryStream(9, fileItem.getInputStream());
                            pstm.setString(10, fileItem.getName());
                            pstm.setString(11, ibcode);
                            int i = pstm.executeUpdate();
                            if (i != 0) {
                                Date date = new Date();
                                SimpleDateFormat sf = new SimpleDateFormat("YYYY:mm:dd HH:mm:ss");
                                String now  = sf.format(date);
                                String process = "Register";
                                st = con.createStatement();
                                int j = st.executeUpdate("insert into history(uname, role, process, ptime)values('"+name+
                                "','"+role+"','"+process+"','"+now+"')");
                               if (j != 0) {
                                    response.sendRedirect("reg.jsp?msg=success");
                                }
                            } else {
                                response.sendRedirect("reg.jsp?msgg=failed");
                            }
                            con.close();
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(Reg.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
