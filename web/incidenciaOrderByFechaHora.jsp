<%-- 
    Document   : incidenciaOrderByFechaHora
    Created on : 11-may-2018, 22:54:02
    Author     : Anjo
--%>
<%@page import="java.util.List"%>
<%@page import="entities.Incidencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div>
        <h1>Ver Incidencias Urgentes Según Fecha y Hora</h1>
        <%
            List<Incidencia> incidencia = (List<Incidencia>) request.getAttribute("incidencia");
            if(incidencia.isEmpty()){                     
        %>
        <h2>No hay incidencias registrados</h2>
        <%
        }else{
        %>
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
                  for(Incidencia i: incidencia){
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
             <%
            }
            %>
            
        </div>
            <form action="adminValidado.jsp">
                <input type="submit" value="Volver">
            </form>
    </body>
</html>
