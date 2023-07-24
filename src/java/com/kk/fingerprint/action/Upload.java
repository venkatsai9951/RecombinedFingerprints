/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kk.fingerprint.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Upload extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String email = request.getSession().getAttribute("email").toString();
            String uname = request.getSession().getAttribute("name").toString();
            String role = request.getSession().getAttribute("role").toString();
            Connection con = null;
            PreparedStatement pstm = null;
            Statement st = null;
            String fid = null;
            String fname = null;
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

                    if (fileItem.getFieldName().equals("fid")) {
                        fid = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("fname")) {
                        fname = fileItem.getString();
                    } else {
                    }
                    boolean isFormField = fileItem.isFormField();
                    if (isFormField) {
                    } else {
                        try {
                            Date date = new Date();
                            SimpleDateFormat sf = new SimpleDateFormat("YYYY:mm:dd HH:mm:ss");
                            String now = sf.format(date);
                            con = Database.getConnection();
                            pstm = con.prepareStatement("insert into upload(fid, file, filename, fsize, uemail, uname, utime)values(?,?,?,?,?,?,?)");
                            pstm.setString(1, fid);
                            pstm.setBinaryStream(2, fileItem.getInputStream());
                            pstm.setString(3, fname);
                            pstm.setString(4, String.valueOf(fileItem.getSize() / 1024));
                            pstm.setString(5, email);
                            pstm.setString(6, uname);
                            pstm.setString(7, now);
                            int i = pstm.executeUpdate();
                            if (i != 0) {
                                String process = "Upload";
                                st = con.createStatement();
                                int j = st.executeUpdate("insert into history(uname, role, process, ptime)values('" + uname
                                        + "','" + role + "','" + process + "','" + now + "')");
                                if (j != 0) {
                                    response.sendRedirect("upload.jsp?msg=success");
                                }
                            } else {
                                response.sendRedirect("upload.jsp?msgg=failed");
                            }
                            con.close();
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
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
