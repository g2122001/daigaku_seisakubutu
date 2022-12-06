<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // UserManagerServlet.javaから送られたmessageの値を取り出す
    String str = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ユーザー登録結果</title>
        <style>
            body{
                background-image: url("APEX.jpg");
            }
            mark{
                background: beige;
            }

            a{
                color: aqua;
            }
        </style>
    </head>
    <body>
        <h1><u>ユーザー登録結果</u></h1>
        <table>
            <tr>
                <td  valign="top"><h2><mark><%=str%></mark></h2></td>
                <td><img src="maru.png" width="400" height="400" alt="ng"/></td>
            </tr>
        </table>
         <table>
            <tr>
                <th>
                    <form method="POST" action="./rank.jsp">
                        <input type="submit" value="降下地点登録はこちら">
                    </form>
        <footer>
            <hr>
            <a href="login.html">ログイン・新規登録ページに戻る</a>
        </footer>
                    <p>※ログインしている方のみ登録が行えます。新規登録された方はログインをお願いします。</p>
    </body>
</html>

        


