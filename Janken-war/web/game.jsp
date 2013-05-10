<%-- 
    Document   : game
    Created on : 10 mai 2013, 18:35:31
    Author     : babouchot
--%>

<%@page import="janken.session.GamerSessionLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="janken.persistence.Gamer"%>
<%@page import="janken.game.GameInstance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Janken</title>
    </head>
    <%! Gamer gamer;%>
    <%! GameInstance instance;%>
    <%! String played;%>
    <%! String cpu; %>
    <%
        played = request.getParameter("coup");
        try {
            gamer = (Gamer) session.getAttribute("gamer");
            InitialContext ic = new InitialContext();
            Object o = ic.lookup("java:global/Janken/Janken-ejb/GamerSession");
            GamerSessionLocal gamSession = (GamerSessionLocal) o;
            instance = (GameInstance) session.getAttribute("instance");

            gamer.setEtat(Gamer.Etat.INGAME);
            gamSession.merge(gamer);

            if (instance == null) {
                instance = new GameInstance();
                session.setAttribute("instance", instance);
            }
            
            try {
                if (instance.playerWin())
                    gamer.addVictoire();
                else 
                    gamer.addDefaite();
                gamer.setEtat(Gamer.Etat.CONNECTE);
                gamSession.merge(gamer);
                session.setAttribute("instance", null);
                response.sendRedirect("janken.jsp?id="+session.getId());
            }
            catch (GameInstance.GameInstanceNotFinishedException e) {
                
            }

            if (played != null) {
                cpu = instance.play(GameInstance.Janken.valueOf(played.toUpperCase()));
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Gamer connection failed : " + e.toString());
        }
    %>
    <body>
    <center>
        <h2>Jan ... Ken ... Pon !!!</h2>
        <div id="gamer">
            <p style="color: green; font-weight: bold;">
                <%= gamer.getPseudo()%> : <%= instance.getPlayerScore()%>/10
            </p>
        </div>
        <div id="cpu">
            <p style="color: red; font-weight: bold;">
                CPU : <%= instance.getCpuScore()%>/10     
            </p>
        </div>
        <div>
            <p style="float: left;">
                <%
                    if (played != null) {
                        out.println("Vous avez joué : " + played.toUpperCase());
                    }
                %>
            </p>
            <img src="./ressources/rpsls.jpg" >
            <p style="float: right;">
                <%
                    if (played != null) {
                        out.println("CPU a joué : " + cpu);
                    }
                %>
            </p>
        </div>
        <div>
            <p>Que voulez vous jouer ?</p>
            <a href="game.jsp?coup=rock"><img src="./ressources/rock.jpg" ></a>
            <a href="game.jsp?coup=paper"><img src="./ressources/paper.jpg" ></a>
            <a href="game.jsp?coup=scissors"><img src="./ressources/scissor.jpg" ></a>
            <a href="game.jsp?coup=lizard"><img src="./ressources/lizard.jpg" ></a>
            <a href="game.jsp?coup=spock"><img src="./ressources/spock.jpg" ></a>
        </div>
    </center>
</body>
</html>
