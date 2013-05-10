<%-- 
    Document   : janken
    Created on : 9 mai 2013, 23:55:18
    Author     : babouchot
--%>

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
        HttpSession userSession = request.getSession();
        String userMail = (String) userSession.getAttribute("id");
        String userMdp = (String) userSession.getAttribute("mdp");

        try {
            InitialContext ic = new InitialContext();
            Object o = ic.lookup("java:global/Janken/Janken-ejb/GamerSession");
            gamSession = (GamerSessionLocal) o;

            gamer = (Gamer) userSession.getAttribute("gamer");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Gamer connection failed : " + e.toString());
        }
    %>
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
            <button>Jouer maintenant!</button>

            <div>
                <%
                    List<Gamer> gamers = gamSession.findAllConnected();
                    out.println("<p>Liste des joueurs connectés :</p>"
                            + "\n<ul>");
                    for (Gamer gamer : gamers) {
                        out.println("<li><a href=\"joueur.jsp?id=" + gamer.getPseudo()
                                + "\">" + gamer.getPseudo() + "</a></li>");
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
