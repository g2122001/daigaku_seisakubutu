import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // 次の課題で使用
import java.util.Arrays;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

public class UserManagerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // JSPへ転送するための準備
        ServletContext application = getServletContext();

        // 成功view.jsp 失敗error.jsp のどちらに飛ぶかをDB操作結果に基づき決める
        String next_view = "";

        // view.jspに送る変数を用意
        String connection_result = "";

        // クライアントに返すコンテンツのタイプ，文字コードを設定する
        response.setContentType("text/html;charset=UTF-8");

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
        String username = request.getParameter("uname");
        String userpass = request.getParameter("pass");
        String md5pass = "";

        // ユーザーからのリクエストがログインか新規登録か判定する
        String action = request.getParameter("action");
HttpSession session = request.getSession(false);

        //sessionが無かったら作成
        if (session == null) {
            session = request.getSession(true);
        }
        // ユーザーからのリクエストが登録だったら
        if (action.equals("registration")) {
            // ユーザーから入力されたパスワードをMD5でハッシュ化
            try {
                md5pass = md5(userpass);
            } catch (Exception e) {
                e.printStackTrace();
            }

            // DBのUSER_TBLにユーザ名とパスワード(ハッシュ値）を新規登録するためのSQL文          
            String sql_message = "insert into App.USER_TBL (username, password) " + "values ('" + username + "','" + md5pass + "')";// ← " を ’ で囲っている

            // DBに接続し，SQL文を実行する
            try (
                    // DB作成時に登録したユーザー名とパスワードを用いてDBに接続する
                    Connection connection = DriverManager.getConnection(url, user, password);
                    // SQL文の実行準備
                    PreparedStatement statement = connection.prepareStatement(sql_message);) {

                // SQL文の実行　executeQuery()ではない点に要注意
                // INSERT文，UPDATE文，およびDELETE文を実行した場合は，
                // 更新行数が返却されます．これら以外のSQL文を実行した場合は，0が返却されます．
                int updated_lines = statement.executeUpdate();

                // テーブルの更新行数が0ではない＝更新があった
                if (updated_lines != 0) {
                    connection_result = username + "　をユーザーとして登録しました！";
                    next_view = "AddSuccess.jsp";
                } else {
                    //何らかの理由でテーブルを更新できなかった＝例外エラーに飛ぶのでこの条件分岐は本来は不要
                    connection_result = "登録できませんでした・・・";
                    next_view = "AddError.jsp";
                }
                if (username.isEmpty()){
                    connection_result = "ユーザー名が空白です。再度登録してください。";
                    next_view = "AddError.jsp";
                }

            } catch (Exception e) {
                out.println("例外エラー：" + e.getMessage());
            }

            // view.jspのためにmessageプロパティ値をconnection_resultの中に入っている値にセット
            request.setAttribute("message", connection_result);

            // view.jspに飛ぶ（結果表示はJSPに任せる）
            application.getRequestDispatcher("/WEB-INF/" + next_view).forward(request, response);

            // ユーザーからのリクエストがログイン（ユーザー認証）だったら　※ユーザー認証は未実装    
        } else if (action.equals("login")) {
            String sql_message = "select * from user_tbl where username='"+ username +"'";
        
            // DBに接続し，SQL文を実行する
            try (
                    // DB作成時に登録したユーザー名とパスワードを用いてDBに接続する
                    Connection connection = DriverManager.getConnection(url, user, password);
                    PreparedStatement statement = connection.prepareStatement(sql_message);
 
            ) {      
                // SQLの実行結果を受け取る
                ResultSet results = statement.executeQuery();
                
                String name = "";
                
                if (results.next()) {
                    // ユーザー名がDBのUSER_TBL上に存在したら次はパスワードチェック
                    String dp_pass = results.getString("password");
                    md5pass = md5(userpass);
                    
                    if (dp_pass.equals(md5pass)) {
                        name = results.getString("username");
                        connection_result = "接続成功！";
                        connection_result = connection_result.concat(name + "　さん，ようこそ！");
                        next_view = "AddSuccess.jsp";
                    }else{
                        connection_result = "パスワードが間違っています";
                        next_view = "AddError.jsp";
                    }
                    
                }else{
                    connection_result = "入力されたユーザー存在しません";
                    next_view = "AddError.jsp";
                }
            } catch (Exception e) {
                out.println("Exception" + e.getMessage());
        }

            // view.jspのためにmessageプロパティ値をconnection_resultの中に入っている値にセット
            request.setAttribute("message", connection_result);
            session.setAttribute("user", username);

            // view.jspに飛ぶ（結果表示はJSPに任せる）
            application.getRequestDispatcher("/WEB-INF/"+next_view).forward(request, response);

        }
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

    //　パスワードをMD5に変換
    private static String md5(String password) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.update(password.getBytes());
        String digest = new BigInteger(1, md5.digest()).toString(16);
        char[] buf = new char[32];
        Arrays.fill(buf, '0');
        System.arraycopy(digest.toCharArray(), 0, buf,
                buf.length - digest.length(), digest.length());
        return new String(buf);
    }
}
