<%-- 
    Document   : incidenciaByEmpleado
    Created on : 11-may-2018, 22:15:30
    Author     : Anjo
--%>
<%@page import="java.util.List"%>
<%@page import="entities.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Incidencia según el Empleado</h1>
        <%
        List<Empleado> empleados = (List<Empleado>) request.getAttribute("empleados");
        if(empleados.isEmpty()){
        %>
        <h2>No hay empleados registrados</h2>
        <%
        }else{
        %>
        <div>
            <form action="GetIncidenciaByEmpleado2" method="POST">
                <label>Seleciona el empleado:</label>
                <select name="empleado">
                <% for(Empleado e: empleados){ %>
                <option><%=e.getNombreusuario()%></option>
                <% }%>
                </select>
                <span class="btn_submit"><input type="submit" value="Get"></span>
            </form>
        </div>
        <%      
        }
        %>
       <form action="adminValidado.jsp">
                <input type="submit" value="Volver">
       </form>
    </body>
</html>
