<%--
    Document : index
    Created on : 12 mars 2013, 14:02:37
    Author : maureill
--%>

<%@page import="janken.persistence.Gamer"%>
<%@page import="janken.session.GamerSessionLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Janken</title>
    </head>
    <body>
    <center>
        <h1>Bienvenue sur le jeu Janken !</h1>
        <p><a href="inscription.jsp">Inscris toi</a> ou joue en te connectant !</p>
        <form method="post" action="/Janken-war/index.jsp">
            <table border=10>
                <tr>
                    <td>email (id) : </td>
                    <td><input type="text" name="id" size="25" value=""></td>
                </tr>
                <tr>
                    <td>mot de passe : </td>
                    <td><input type="password" name="mdp" size="25" value=""></td>
                </tr>
            </table>
            <p>
                <input type="submit" name="submit" value="Login">
            </p>
        </form>
        <%
            String mail = request.getParameter("id");
            String mdp = request.getParameter("mdp");

            if (mail != null && !"".equals(mail)) {
                try {
                    InitialContext ic = new InitialContext();
                    Object o = ic.lookup("java:global/Janken/Janken-ejb/GamerSession");
                    GamerSessionLocal gamSession = (GamerSessionLocal) o;

                    Gamer gamer = gamSession.searchForGamer(mail, mdp);

                    if (gamer != null) {
                        response.sendRedirect("janken.jsp?id=" + gamer.getPseudo());
                    }
                    else {
                        out.println("Utilisateur inconnu : veuillez vérifier vos identifiants");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Gamer connection failed : " + e.toString());
                }
            }
        %>
    </center>
</body>
</html>