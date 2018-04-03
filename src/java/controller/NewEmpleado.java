/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.incidenciasEJB;
import entities.Empleado;
import exceptions.MisExcepciones;
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
public class NewEmpleado extends HttpServlet {

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
        // Recogemos las variables del formulario 
        String nomusuario = request.getParameter("nomusuario");
        String nomcompleto = request.getParameter("nomcompleto");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");
        String ciudad = request.getParameter("ciudad");
        
        // Creamos el cocinero con los datos del formulario
        Empleado e = new Empleado(nomusuario, nomcompleto, password, telefono, ciudad);
        try {
            incidencias.altaEmpleado(e);
            // Si el alta ha ido bien devolvemos msg ok
            request.setAttribute("status", "Empleado dado de alta");
        } catch (MisExcepciones ex) {
            // Devolvemos mensaje de la excepción a la vista
            request.setAttribute("status", ex.getMessage());
        }
        // Redirigimos a la vista (final.jsp en este caso)
        request.getRequestDispatcher("/final.jsp").forward(request,response);
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
