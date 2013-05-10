<%--
    Document : inscription
    Created on : 19 mars 2013, 13:41:47
    Author : maureill
--%>

<%@ page language="java" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="janken.persistence.Gamer" %>
<%@ page import="janken.session.GamerSessionLocal" %>
<%@ page import="javax.naming.InitialContext" %>

<html>

<head><title>Inscription</title></head>

<body bgcolor="white">
<center>
<h1>Inscription à Janken :</h1>


<form method="post" action="/Janken-war/inscription.jsp">
<table border=10>
  <tr>
    <td>email : </td>
    <td><input type="text" name="mail" size="25" value=""></td>
  </tr>
  <tr>
    <td>pseudo : </td>
    <td><input type="text" name="pseudo" size="25" value=""></td>
  </tr>
  <tr>
    <td>mot de passe : </td>
    <td><input type="password" name="mdp" size="25" value=""></td>
  </tr>
</table>
<p>
<input type="submit" name="insc" value="S'inscrire">
</p>
</form>

<%
String mail = request.getParameter("mail");
String pseudo = request.getParameter("pseudo");
String mdp = request.getParameter("mdp");

if (mail != null && !"".equals(mail)) {
    try {
        InitialContext ic = new InitialContext();
        Object o = ic.lookup("java:global/Janken/Janken-ejb/GamerSession");
        GamerSessionLocal gamSession = (GamerSessionLocal) o;

        Gamer gamer = new Gamer(mail, pseudo, mdp);
        gamSession.persist(gamer);
        response.sendRedirect("index.jsp");

    } catch(Exception e) {
        e.printStackTrace();
        out.println("<p style=\"color:red;\">inscription échouée : "
                + "un joueur est déja inscrit pour cette adresse mail");
    }
}
%>

<hr>
[<a href="index.jsp">Accueil</a>]
</center>
</body>
</html>
