<%-- 
    Document   : cambiarPassword
    Created on : 15-abr-2018, 21:29:53
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
            String password = (String)request.getAttribute("password");
        %>
        <div>
            <h1>Cambiar Password</h1>
             <form action="CambiarPass" method="POST">
                 <input type="hidden" name="nombreUsuario" value="<%=user.getNombreusuario()%>">  
                 <label>Password</label> 
                 <input type="text" name="password" value="<%=password%>" required>
                 <span><input type="submit" value="Cambiar"></span>
             </form>
            <%
            if(user.getNombreusuario().equalsIgnoreCase("admin")){
            %>
            <form action="adminValidado.jsp">
                <input type="submit" value="Volver">
            </form>
            <%}else{%>
            <form action="userValidado.jsp">
                <input type="submit" value="Volver">
            </form>
            <%}%>
        </div>
    </body>
</html>
