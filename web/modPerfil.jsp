<%-- 
    Document   : modificarPerfil
    Created on : 15-abr-2018, 19:25:30
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
            Empleado user = (Empleado)session.getAttribute("user");
            String nombreCompleto = (String)request.getAttribute("nombreCompleto");
            String telefono = (String)request.getAttribute("telefono");
            String ciudad = (String)request.getAttribute("ciudad");

        %>
        <h1>Modificar Perfil</h1>
         <div>
            <form action="ModificarPerfil" method="POST">
                <input type="hidden" name="nombreUsuario" value="<%=user.getNombreusuario()%>">  
                 <label>Nombre Completo</label>
                 <input type="text" name="nombreCompleto" value="<%=nombreCompleto%>" required>
                 <label>Telefono</label>
                 <input type="text" name="telefono" value="<%=telefono%>" required>
                 <label>Ciudad</label>
                 <input type="text" name="ciudad" value="<%=ciudad%>" required>
                 <span><input type="submit" value="Editar"></span>
             </form>
            <%
            if(user.getNombreusuario().equalsIgnoreCase("admin")){
            %>
            <form action="adminValidado.jsp">
                <input type="submit" value="Back">
            </form>
            <%}else{%>
            <form action="userValidado.jsp">
                <input type="submit" value="Back">
            </form>
            <%}%>
        </div>
    </body>
</html>
