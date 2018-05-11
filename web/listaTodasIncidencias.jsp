<%-- 
    Document   : listaTodasIncidencias
    Created on : 15-abr-2018, 23:08:21
    Author     : Anjo
--%>
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
        <h1>Lista de todas las Incidencias</h1>
        <%
            List<Incidencia> incidencias = (List<Incidencia>) request.getAttribute("incidencias");
            if(incidencias.isEmpty()){                     
        %>
        <h2>No hay incidencias registradas</h2>
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
            <form action="adminValidado.jsp">
                <input type="submit" value="Volver">
            </form>
        <%
        }
        %>
    </body>
</html>
