<%-- 
    Document   : lastLogin
    Created on : 15-abr-2018, 23:14:46
    Author     : Anjo
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Empleado"%>
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
           <h1>Registro de Logins</h1>
        <% 
            List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");
            if(empleados.isEmpty()){
        %>
        <h2>No hay empleados registrados</h2>
        <%
        }else{
        %>
            <form action="GetLastLogin2" method="POST">
                <label>Seleciona el empleado:</label>
                <select name="empleado" id="">
                <%for(Empleado e: empleados){%>
                <option><%=e.getNombreusuario()%></option>
                <%}
                %>
                </select>
                <span class="btn_submit"><input type="submit" value="Ver"></span>
            </form>
        <%
        }
        %>
        <form action="adminValidado.jsp">
            <input type="submit" value="Volver">
        </form>
        </div>
        
    </body>
</html>
