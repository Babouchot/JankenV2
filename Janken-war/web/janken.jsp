<%-- 
    Document   : janken
    Created on : 9 mai 2013, 23:55:18
    Author     : babouchot
--%>

<%@ page language="java" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="janken.session.GamerSessionLocal"%>
<%@page import="janken.persistence.Gamer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Janken</title>
    </head>
    <%! Gamer gamer;%>
    <%! GamerSessionLocal gamSession;%>

    <%
        String idSession = (String) request.getParameter("id");
        String disconnect = (String) request.getParameter("disconnect");

        try {
            InitialContext ic = new InitialContext();
            Object o = ic.lookup("java:global/Janken/Janken-ejb/GamerSession");
            gamSession = (GamerSessionLocal) o;

            gamer = (Gamer) session.getAttribute("gamer");

            if ("true".equals(disconnect)) {
                gamer.setEtat(Gamer.Etat.ABSENT);
                gamSession.merge(gamer);
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Gamer connection failed : " + e.toString());
        }
    %>
    <p style="text-align: right;"><a href="janken.jsp?disconnect=true">se déconnecter</a></p>
    <center>
        <body>
            <h2>Bonjour <b><%= gamer.getPseudo()%></b></h2>
            <div id="stats">
                <p>Vos statistiques :</p>
                <table border=10>
                    <tr>
                        <td>Victoires: </td>
                        <td><%= gamer.getVictoires()%></td>
                    </tr>
                    <tr>
                        <td>Défaites: </td>
                        <td><%= gamer.getDefaites()%></td>
                    </tr>
                </table>
            </div>
            <br />
            <a href="game.jsp"><button>Jouer maintenant!</button></a>

            <div>
                <%
                    List<Gamer> gamers = gamSession.findAllConnected();
                    out.println("<p>Liste des joueurs connectés (Victoires/Défaites) :</p>"
                            + "\n<ul>");
                    for (Gamer gamer : gamers) {
                        out.println("<li><a href=\"joueur.jsp?id=" + gamer.getPseudo()
                                + "\">" + gamer.getPseudo() + "</a>(" + gamer.getVictoires()
                                + "/" + gamer.getDefaites() + ")</li>");
                    }
                    List<Gamer> inGame = gamSession.findAllInGame();
                    for (Gamer gamer : inGame) {
                        out.println("<li style=\"color:green;\">" + gamer.getPseudo() + "</li>");
                    }
                    out.println("</ul>");
                %>
            </div>
        </body>
    </center>
</html>
