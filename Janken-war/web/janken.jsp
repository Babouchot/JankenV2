<%-- 
    Document   : janken
    Created on : 9 mai 2013, 23:55:18
    Author     : babouchot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Bonjour <b><%= request.getParameter("id")%></b></h2>
    </body>
</html>
