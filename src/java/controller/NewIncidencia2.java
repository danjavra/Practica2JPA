/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.incidenciasEJB;
import entities.Empleado;
import entities.Historial;
import entities.Incidencia;
import exceptions.MisExcepciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZonedDateTime;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anjo
 */
public class NewIncidencia2 extends HttpServlet {
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
        Integer idincidencia = Integer.parseInt(request.getParameter("idincidencia"));
       
            String origen = request.getParameter("empleado");
            String destino = request.getParameter("destino");
            try{
                Empleado orig = incidencias.getEmpleadoByUser(origen);
                Empleado dest = incidencias.getEmpleadoByUser(destino);
                String fechaHora = request.getParameter("fechaHora");
                String detalle = request.getParameter("detalle");
                String tipo = request.getParameter("tipo");
                Incidencia i = new Incidencia(idincidencia, fechaHora, detalle, tipo, orig, dest);
                String date = ZonedDateTime.now().toString();
                Historial h = new Historial("U", date, orig);
                Historial incidesti = new Historial("C",date,dest);
                incidencias.newIncidencia(i);
                request.setAttribute("empleado", origen);
                request.setAttribute("success","New Incidencia Registered");
                if(tipo.equalsIgnoreCase("urgentes")){
                incidencias.newHistorial(h);
                }
                incidencias.newHistorial(incidesti);
            }catch(MisExcepciones ex){
                request.setAttribute("errorStatus", ex.getMessage());
        }
                request.getRequestDispatcher("/incidencias2.jsp").forward(request, response);
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
