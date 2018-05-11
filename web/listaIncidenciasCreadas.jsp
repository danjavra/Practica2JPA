<%-- 
    Document   : getIncidenciaCreated
    Created on : 15-abr-2018, 22:06:13
    Author     : Anjo
--%>
<%@page import="entities.Empleado"%>
<%@page import="entities.Incidencia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Empleado user = (Empleado) session.getAttribute("user");%>
        <h1>Lista de Incidencias Creadas de <%=user.getNombreusuario()%></h1>
        <%
            String empleado = (String)request.getAttribute("empleado");
            List<Incidencia> incidencias = (List<Incidencia>) request.getAttribute("incidencias");
            if(incidencias.isEmpty()){                     
        %>
        <h2>No tiene incidencias creadas</h2>
        <%
        }else{
        %>
            <div>
            <table>
                <tr>
                      <th>IdIncidencia</th>
                      <th>Origen</th>
                      <th>Destino</th>
                      <th>FechaHora</th>
                      <th>Detalle</th>
                      <th>Tipo</th>
                </tr>
                  <%
                  for(Incidencia i: incidencias){
                  %>
                <tr>
                      <td><%=i.getIdincidencia() %></td>
                      <td><%=i.getOrigen()%></td>
                      <td><%=i.getDestino()%></td>
                      <td><%=i.getFechahora()%></td>
                      <td><%=i.getDetalle()%></td>
                      <td><%=i.getTipo()%></td>
                </tr>
                  <%}%>
            </table>
        </div>
        <%
        }
        if(empleado.equalsIgnoreCase("admin")){
        %>
        <form action="adminValidado.jsp">
            <input type="submit" value="Volver">
        </form>
        <%}else{%>
         <form action="userValidado.jsp">
            <input type="submit" value="Volver">
        </form>
        <%}%>
        
    </body>
</html>
