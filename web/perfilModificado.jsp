<%-- 
    Document   : perfilModificado
    Created on : 15-abr-2018, 20:11:34
    Author     : Anjo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar Perfil</h1>
        <%
            String nombreUsuario = (String)request.getAttribute("nombreUsuario");
            String status = (String)request.getAttribute("success");
        %>
        <h2 style="text-align:center;color:green;"><%=status%></h2>
        <%
            if(nombreUsuario.equalsIgnoreCase("admin")){
        %>
        <form action="adminValidado.jsp">
            <input type="submit" value="Back">
        </form>
        <%}else{%>
        <form action="userValidado.jsp">
            <input type="submit" value="Back">
        </form>
        <%}%>
    </body>
</html>
