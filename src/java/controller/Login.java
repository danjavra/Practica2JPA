/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.incidenciasEJB;
import entities.Empleado;
import entities.Historial;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DAM
 */
public class Login extends HttpServlet {

    @EJB incidenciasEJB incidencias;
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
        String nomusuario = request.getParameter("user");
        String password = request.getParameter("pass");
        ZonedDateTime d =  ZonedDateTime.now();
        String date = d.toString();
        Empleado e = incidencias.getEmpleadoByUser(nomusuario);
        Historial h = new Historial("I", date, e);
       if(incidencias.empleadoVerificado(nomusuario,password).isEmpty()){
         request.setAttribute("errorStatus", "Login Failed");
       }else {
        request.getSession(true).setAttribute("user", e);
        
           } if (nomusuario.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")){
             response.sendRedirect(request.getContextPath() + "/adminValidado.jsp");   
           }else{
               response.sendRedirect(request.getContextPath() + "/userValidado.jsp");
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
