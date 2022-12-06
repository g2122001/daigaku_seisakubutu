import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;//DBを利用するために必要なパッケージをインポート
import javax.servlet.http.HttpSession;

public class ShowServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //クライアントに返すコンテンツのタイプ、文字コードを設定する
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>オススメ降下地点閲覧ページ</title>");
        out.println("<style>");
        out.println("body{background-image: url(\"APEX2.jpg\");background-color:rgba(255,255,255,0.5); background-blend-mode:lighten; width:1250px;}"
                + "mark{background: beige; color: blueviolet;}"
                + "a{background-color: yellow;color: blue;}"
                + "th{background-color:rgba(255,0,0,0.8); padding: 10px 10px;}"
                + "td{background-color:rgba(215, 255, 254, 0.8); padding: 0px 10px;}"
                + "input{margin:0px 250px;}"
                + "img{padding: 0px 50px;}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        // 接続するデータベースの名前、アカウント情報を設定
        String db_name = "USER";
        String user = "APP";
        String password = "app";

        // DBに接続するためのドライバを読み込む
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (Exception e) {
            e.printStackTrace();
        }

        // DBへの接続方法を設定
        String url = "jdbc:derby://localhost/" + db_name;
        // 実行するSQL文を設定
        //String sql_message = "SELECT username FROM APP.ticket_tbl";
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("user");
        String sql0="select USERNAME FROM user_tbl";
        String sql="select KINGSCANYON FROM user_tbl";
        String sql2="select WORLDEDGE FROM user_tbl";
        String sql3="select OLYMPUS FROM user_tbl";
        String[] USER=new String[10];
        String[] KING=new String[10];
        String[] WORLD=new String[10];
        String[] OLYM=new String[10];
        int a;
        int h=0;
        int i=0;
        int j=0;
        int k=0;
       // DBに接続し，SQL文を実行する
        try (
                // DB作成時に登録したユーザー名とパスワードを用いてDBに接続する
                Connection connection = DriverManager.getConnection(url, user, password);
                Statement statement = connection.createStatement();) {
            // SQLの実行結果を受け取る
            ResultSet results0 = statement.executeQuery(sql0);
            while (results0.next()) {
                USER[h] = results0.getString("USERNAME");
                h++;
            }
            ResultSet results = statement.executeQuery(sql);
            while (results.next()) {
                KING[i] = results.getString("KINGSCANYON");
                i++;
            }
            ResultSet results2 = statement.executeQuery(sql2);
            while (results2.next()) {
                WORLD[j] = results2.getString("WORLDEDGE");
                j++;
            }
             ResultSet results3 = statement.executeQuery(sql3);
            while (results3.next()) {
                OLYM[k] = results3.getString("OLYMPUS");
                k++;
            }
            
            //カンマ区切りをそれぞれ配列に代入
            out.println("");
            out.println("<h1><u>オススメ降下場所一覧</u></h1>");
            out.println("<table cellpadding=\"0\" cellspacing=\"0\" border=\"2\" align=\"left\" style=\"margin:30px;\">");
            out.println("<tr>");
            out.println("<th>ユーザー名</th>");
            out.println("<th>キングスキャニオン</th>");
            out.println("<th>ワールドエッジ</th>");
            out.println("<th>オリンパス</th>");
            out.println("</tr>");
              for (int z = 0; z < 10; z++) {
                out.println("<tr>");
                out.println("<td>" + USER[z] + "</td>");
                out.println("<td>" + KING[z] + "</td>");
                out.println("<td>" + WORLD[z] + "</td>");
                out.println("<td>" + OLYM[z] + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            out.println("Exception" + e.getMessage());
        }

        out.println("<div align=\"right\">");
        out.println("<footer>");
        out.println("<hr>");
        out.println("<a href=\"DeleteSession\" >ログイン・新規登録ページに戻る</a>");
        out.println("</footer>");
        out.println("</div>");

        out.println("</body>");
        out.println("</html>");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
