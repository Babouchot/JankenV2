<%--
    Document : index
    Created on : 12 mars 2013, 14:02:37
    Author : maureill
--%>

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
        <form method="post" action="/customer-cmp-war/createCustomer.jsp">
            <table border=10>
                <tr>
                    <td>email (id) : </td>
                    <td><input type="text" name="id" size="25" value=""></td>
                </tr>
                <tr>
                    <td>mot de passe : </td>
                    <td><input type="text" name="mdp" size="25" value=""></td>
                </tr>
            </table>
            <p>
                <input type="submit" name="submit" value="Login">
            </p>
        </form>
    </center>
    </body>
</html>