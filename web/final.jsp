<%-- 
    Document   : final
    Created on : 03-abr-2018, 9:46:44
    Author     : DAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incidencias</title>
    </head>
    <body>
          <%
            // Recogemos la variable status que nos han pasado
            String status = (String) request.getAttribute("status");
            // Por si llaman al jsp sin pasar por el servlet
            if (status != null) {
                // Mostramos el msg por pantalla
        %>
        <h1><%= status %></h1>
        <%
            }

        %>
        <form action="index.html">
            <input type="submit" value="Back">
        </form>
    </body>
</html>
