<%-- 
    Document   : userValidado
    Created on : 03-abr-2018, 10:44:25
    Author     : DAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de usuario validado</title>
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
            if (user != null) {
        %>
        <h1>Hola <%=user%></h1>
        <% } else {
        %>
        <h1>No hay usuario validado.</h1>
        <%
    }%>
    </body>
</html>