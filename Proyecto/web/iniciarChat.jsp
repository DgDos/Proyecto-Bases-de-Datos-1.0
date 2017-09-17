<%-- 
    Document   : iniciarChat
    Created on : Sep 12, 2017, 7:46:52 PM
    Author     : FiJus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Chat</title>
    </head>
    <body>
        <h1>Inicio de Chat</h1>
        
        <form action="Chat" method="POST">
            Usuario con el que desea empezar un chat: <input type="text" name="usuario">
            Asunto: <input type="text" name="asunto">
            <input type="submit" name="Iniciar"/>

        </form>
    </body>
</html>
