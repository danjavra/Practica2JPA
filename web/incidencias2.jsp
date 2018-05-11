<%-- 
    Document   : incidencias2
    Created on : 15-abr-2018, 21:53:27
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
        <h1 style="text-align: center;color:blue;">Status New Incidencia</h1>
        <% 
            String success = (String)request.getAttribute("success");
            String empleado = (String)request.getAttribute("empleado");
            if(success!=null){
        %>
        <h1><%=success%></h1>    
        <%} else{%>
        <h2>Ya existe esta incidencia</h2>
        <%}%>
         <%
        if(empleado.equalsIgnoreCase("admin")){
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
