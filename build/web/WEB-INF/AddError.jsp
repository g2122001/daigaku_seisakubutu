<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
                background: gainsboro;
                color: blueviolet;
            }
            a{
                background-color:yellow;
                color: blue;
            }
        </style>
    </head>
    <body>
        <h1><u><mark>ユーザー登録エラー</mark></u></h1>
        <table>
            <tr>
                <td  valign="top"><h1><mark><%=str%></mark></h1></td>
                <td><img src="batu.png" width="400" height="400" alt="ng"/></td>
            </tr>
        </table>
        <footer>
            <hr>
            <a href="login.html">ログイン・新規登録ページに戻る</a>
        </footer>
    </body>
</html>

