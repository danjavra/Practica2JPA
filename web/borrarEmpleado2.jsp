<%-- 
    Document   : borrarEmpleado2
    Created on : 15-abr-2018, 22:54:05
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
        <h1 style="text-align:center;color:blue">Empleado Borrado</h1>
        <% String status = (String)request.getAttribute("status");%>
        <h2 style="text-align:center;color:green"><%=status%></h2>
        <form action="adminValidado.jsp">
            <input type="submit" value="Volver">
        </form>
    </body>
</html>
