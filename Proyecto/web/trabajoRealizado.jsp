<%-- 
    Document   : trabajoRealizado
    Created on : Sep 12, 2017, 7:50:28 PM
    Author     : FiJus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notificacion de trabajo realizado</title>
    </head>
    
    <body>
         <%
        String respuesta = (String) request.getAttribute("guardado");
        if (respuesta != null && respuesta.length() > 0) {
        %>
        <H6><%=respuesta%> </h6>
        <%}%>
        <h1>Que trabajo quieres informar?</h1>
        
        <form action="Finalizado" method="POST">
            Trabajo realizado: <input type="text" name="descripcion"><br>
            Hora finalizacion: <input type="text" name="hora"><br>
            Empresa a la que se realiza: <input type="text" name="empresa">
            
            <input type="submit" name="Login"/>

        </form>
        <a href="menu.jsp"><button>Volver</button></a>
    </body>
</html>
