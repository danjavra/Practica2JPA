<%-- 
    Document   : userValidado
    Created on : 03-abr-2018, 10:44:25
    Author     : DAM
--%>
<%@page import="entities.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de usuario validado</title>
    </head>
    <body>
        <%
            Empleado user = (Empleado) session.getAttribute("user");
            if (user != null) {
        %>
        <h1>Hola <%=user.getNombreusuario()%></h1>
         <br/>
        <form action="DatosPerfil"  method="POST">
            <input type="hidden" value="<%=user.getNombreusuario()%>" name="empleado">
            <input type="submit" value="Editar Perfil">
            
        </form>
            <br/>
        <form action="DatosPassword" method="POST">
            <input type="hidden" value="<%=user.getNombreusuario()%>" name="empleado">
            <input type="submit" value="Change Password">
        </form>
             <br/>
        <form action="NewIncidencia"  method="POST">
                <input type="hidden" value="<%=user.getNombreusuario()%>" name="nombreUsuario">
                <input type="submit" value="Crear Incidencia">
        </form>
              <br/>  
        <form action="IncidenciaCreada" method="POST">
         <input type="hidden" value="<%=user.getNombreusuario()%>" name="nombreUsuario">
         <input type="submit" value="Ver Incidencias Creadas">
        </form>    
              <br/>
              <br/>
        
        <form action="Logout">
                <input type="submit" value="Logout">
        </form>     
        
        <% } else {
        %>
        <h1>No hay usuario validado.</h1>
        <form action="index.html">
            <input type="submit" value="Pag Inicio">
        </form>
        <%
    }%>
    </body>
</html>