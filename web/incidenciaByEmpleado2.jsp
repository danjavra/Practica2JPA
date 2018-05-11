<%-- 
    Document   : incidenciaByEmpleado2
    Created on : 11-may-2018, 22:24:22
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
         <h1>Mostrar Incidencia según el Empleado</h1>
        <div>
            <%
                List<Incidencia> incidencia = (List<Incidencia>)request.getAttribute("incidencia");
                if(incidencia.isEmpty()){
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
       <form action="adminValidado.jsp">
                <input type="submit" value="Volver">
       </form>
    </body>
</html>
