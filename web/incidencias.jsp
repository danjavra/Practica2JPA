<%-- 
    Document   : incidencias
    Created on : 15-abr-2018, 21:42:12
    Author     : Anjo
--%>
<%@page import="java.util.List"%>
<%@page import="entities.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div> 
        <h1>Incidencias</h1>
        <%
        Empleado empleado = (Empleado) request.getAttribute("usuario");
        List<Empleado> empleados = (List<Empleado>)request.getAttribute("empleados");
        if(empleados.isEmpty()){
        %>
        <h2>No se puede crear una incidencia: No existe este empleado</h2>
        <%
        }else{
        %>
            <form action="NewIncidencia2" method="POST">
                <input type="hidden" name="empleado" value="<%=empleado.getNombreusuario()%>">
                <label>Id Incidencia:</label> 
                <input type="number" name="idincidencia">        
                <label>Destino:</label>
                <select name="destino">
                <% for(Empleado e: empleados){ %>
                
                <option><%=e.getNombreusuario()%></option>
                <% } %> 
                </select>
               
                <label>Fecha Hora:</label> 
                <input type="date" name="fechaHora">
 
                <label>Detalle:</label>
                <input type="text" name="detalle">
                <label>Tipo:</label>
                <select name="tipo">
                    <option value="urgentes">urgentes</option>
                    <option value="normal">normal</option>
                </select>    
                <span><input type="submit" value="Register"></span>
            </form>

        <%
        }
        %>
        
       </div>     
        <%
        if(empleado.getNombreusuario().equalsIgnoreCase("admin")){
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
