<%-- 
    Document   : lastLogin2
    Created on : 15-abr-2018, 23:20:14
    Author     : Anjo
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registro de Logins</h1>
        <div>

            <%
                List<String> lastLogin = (List<String>)request.getAttribute("lastLogin");
                if(lastLogin.isEmpty()){
            %>
            <h2>Aún no ha iniciado session</h2>
            <%}else{%>
            <table>
                <tr>
                    <th>Últimos Logins</th>
                </tr>
                <tr>
                    <td><%=lastLogin%></td>
                </tr>
                
            </table>
            <% } %>
            
        </div>   
            <form action="adminValidado.jsp">
                <input type="submit" value="Volver">
            </form>
    </body>
</html>
