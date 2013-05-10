<%-- 
    Document   : game
    Created on : 10 mai 2013, 18:35:31
    Author     : babouchot
--%>

<%@page import="janken.persistence.Gamer"%>
<%@page import="janken.game.GameInstance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Janken</title>
    </head>
    <%! Gamer gamer; %>
    <%! GameInstance instance; %>
    <%
        try {
            gamer = (Gamer) session.getAttribute("gamer");
            instance = (GameInstance) session.getAttribute("instance");
            if (instance == null) {
                instance = new GameInstance();
                session.setAttribute("instance", instance);
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Gamer connection failed : " + e.toString());
        }
    %>
    <body>
        <h1>STOP TE PROMENER SUR MON SERVEUR LA !!</h1>
    </body>
</html>
