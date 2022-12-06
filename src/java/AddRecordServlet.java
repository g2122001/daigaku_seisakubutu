import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

public class AddRecordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // クライアントに返すコンテンツのタイプ，文字コードを設定する
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // JSPへ転送するための準備
        ServletContext application = getServletContext();

        PrintWriter out = response.getWriter();

        // 接続するデータベースの名前，アカウント情報を設定
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

        // login.jspからフォームに入力された値を取得
        HttpSession session = request.getSession(false);

        String username = (String) session.getAttribute("user");
        String KINGSCANYON = request.getParameter("KINGSCANYON");
        String WORLDEDGE = request.getParameter("WORLDEDGE");
        String OLYMPUS = request.getParameter("OLYMPUS");

        // DBに接続し，SQL文を実行する
        try (
                // DB作成時に登録したユーザー名とパスワードを用いてDBに接続する
                Connection connection = DriverManager.getConnection(url, user, password);
                Statement statement = connection.createStatement();) {
            // SQLの実行結果を受け取る
            int results = statement.executeUpdate("update USER_TBL set KINGSCANYON='" + KINGSCANYON + "' where username='" + username + "'");
            results = statement.executeUpdate("update USER_TBL set WORLDEDGE='" + WORLDEDGE + "' where username='" + username + "'");
            results = statement.executeUpdate("update USER_TBL set OLYMPUS='" + OLYMPUS + "' where username='" + username + "'");
            

        } catch (Exception e) {
            out.println("Exception" + e.getMessage());
        }

        // Result.jspに飛ぶ（結果表示はJSPに任せる）
        application.getRequestDispatcher("/WEB-INF/Result.jsp").forward(request, response);
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
