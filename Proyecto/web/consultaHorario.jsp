<%-- 
    Document   : consultaHorario
    Created on : 21/09/2017, 10:08:22 AM
    Author     : LabingXEON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <h1>Coloca El Horario a Consultar</h1>
        <%
        String respuesta = (String) request.getAttribute("guardado");
        if (respuesta != null && respuesta.length() > 0) {
        %>
        <H6><%=respuesta%> </h6>
        <%}%>
        <h1>Que trabajo quieres informar?</h1>
        
        <form action="Consulta" method="POST">
            Hora <input type="text" name="hora"><br>
            <input type="submit" name="Login"/>

        </form>
        <a href="menu.jsp"><button>Volver</button></a>
    </body>
</html>
