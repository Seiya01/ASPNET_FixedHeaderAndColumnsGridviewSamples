<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // アプリケーションのスタートアップで実行するコードです

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  アプリケーションのシャットダウンで実行するコードです

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // ハンドルされていないエラーが発生したときに実行するコードです

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 新規セッションを開始したときに実行するコードです

    }

    void Session_End(object sender, EventArgs e) 
    {
        // セッションが終了したときに実行するコードです 
        // メモ: Session_End イベントは、Web.config ファイル内で sessionstate モードが
        // InProc に設定されているときのみ発生します。session モードが StateServer か、または 
        // SQLServer に設定されている場合、イベントは発生しません。

    }
       
</script>
