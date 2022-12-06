<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>オススメ降下地点確定</title>
        <style>
            body{
                background-image: url("APEX.jpg");
                background-color:rgba(255,255,255,0.5);
                background-blend-mode:lighten;
                width:1250px;
            }
            mark{
                background: beige;
                color: blueviolet;
            }
            a{
                background-color: yellow;
                color: blue;
            }
            input{
                margin:0px 250px; 
            }
        </style>
    </head>
    <body>
        <h1>オススメ降下地点を決定しました！</h1>
        <h3>登録、感謝します。</h3>
        <form method="post" action="./Show">
            <input type="submit" value="オススメ降下地点の確認">
        </form>
        <table>
            <tr>
            </tr>
        </table>

    </body>
</html>
