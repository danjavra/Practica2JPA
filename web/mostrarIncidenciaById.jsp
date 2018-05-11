<%-- 
    Document   : mostrarIncidenciaById
    Created on : 11-may-2018, 22:01:47
    Author     : Anjo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Incidencia"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mostrar Incidencia por su Id</h1>
        <%
            Incidencia incidencia = (Incidencia)request.getAttribute("incidencia");
            if(incidencia==null){
        %>
            <% String status = (String)request.getAttribute("error");%>
            <h2><%=status%></h2>
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

                  <tr>
                      <td><%=incidencia.getIdincidencia() %></td>
                      <td><%=incidencia.getOrigen()%></td>
                      <td><%=incidencia.getDestino()%></td>
                      <td><%=incidencia.getFechahora()%></td>
                      <td><%=incidencia.getDetalle()%></td>
                      <td><%=incidencia.getTipo()%></td>
                  </tr>

            </table>
        </div>

        <%}%>
        <form action="adminValidado.jsp">
            <input type="submit" value="Volver">
        </form>
    </body>
</html>
