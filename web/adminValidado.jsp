<%-- 
    Document   : adminValidado
    Created on : 14-abr-2018, 20:22:43
    Author     : Anjo
--%>
<%@page import="entities.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Empleado user = (Empleado) session.getAttribute("user");
            if(user !=null){
        %>
        <h1>Hola Administrador</h1>
    <div>
            
            <form action="EliminarEmpleado">
                <input type="hidden" value="<%=user.getNombreusuario()%>" name="empleado">
                <input type="submit" value="Eliminar Empleado">
            </form>
            <br/>
            <form action="TodasIncidencias">
                <input type="submit" value="Ver Todas las Incidencias">
            </form>
            <br/>
            <form action="GetLastLogin">
                <input type="submit" value="Ver Data del último Login">
            </form>
            <br/>
            <form action="incidenciasById">
                <input type="submit" value="Ver las Incidencias según su Id">
            </form>
            <br/>
            <form action="GetIncidenciaByEmpleado">
                <input type="submit" value="Ver las Incidencias según el Empleado">
            </form>
            <br/>
            <form action="GetIncidenciaOrderByFechaHora">
                <input type="submit" value="Ver las Incidencia por orden cronológico">
            </form>
            <br/>
            <br/>
            <form action="Logout">
                <input type="submit" value="Logout">
            </form>
           
        </div>
        <%
        }else {
        %>
        <h2>Error de Login</h2>
        <form action="index.html">
            <input type="submit" value="Back">
        </form>
        <%
        }
        %>
        
    </body>
</html>
