<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Fixed Header or Columns</title>
    <%--jQuery読み込み--%>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <%--CSS読み込み--%>
    <link href="Style/superTables.css" rel="stylesheet" type="text/css" />
    <link href="Style/Grid.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
	body {
		padding: 0 20px;
		font-family: Tahoma, Arial, sans serif;
	}
	.fakeContainer { /* The parent container */
		margin: 0 0 20px;
		border: 1px;
		width: 600px; /* Required to set */
		height: 150px; /* Required to set */
		overflow: hidden; /* Required to set */
	}
	h3 {
		margin: 2em 0 0.5em;
	}

		</style> 
</head>
<body bgcolor="#ccffcc">

    <form id="form1" runat="server">
    <p>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Show Checked Index" Width="177px" />
    </p>
    <h2>GridViewの行列固定（superTables.js）</h2>
    <asp:GridView ID="GridView1" runat="server" CellPadding="5" 
        GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="Check Box">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("CheckBox") %>' />
                </ItemTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Column1" HeaderText="Column1"/>
            <asp:BoundField DataField="Column2" HeaderText="Column2"/>
            <asp:BoundField DataField="Column3" HeaderText="Column3"/>
            <asp:BoundField DataField="Column4" HeaderText="Column4"/>
            <asp:BoundField DataField="Column5" HeaderText="Column5"/>
            <asp:BoundField DataField="Column6" HeaderText="Column6"/>
            <asp:BoundField DataField="Column7" HeaderText="Column7"/>
        </Columns>
    </asp:GridView>
        <asp:TextBox ID="TextBox1" runat="server" Height="100px" TextMode="MultiLine" 
        Width="200px"></asp:TextBox>

    <h2>GridViewの行列固定（jquery.tablefix_1.0.0.js）</h2>
    <asp:GridView ID="GridView2" runat="server" CellPadding="5" 
        GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="Check Box">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("CheckBox") %>' />
                </ItemTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Column1" HeaderText="Column1"/>
            <asp:BoundField DataField="Column2" HeaderText="Column2"/>
            <asp:BoundField DataField="Column3" HeaderText="Column3"/>
            <asp:BoundField DataField="Column4" HeaderText="Column4"/>
            <asp:BoundField DataField="Column5" HeaderText="Column5"/>
            <asp:BoundField DataField="Column6" HeaderText="Column6"/>
            <asp:BoundField DataField="Column7" HeaderText="Column7"/>
        </Columns>
    </asp:GridView>
        <asp:TextBox ID="TextBox2" runat="server" Height="100px" TextMode="MultiLine" 
        Width="200px"></asp:TextBox>

    <h2>GridViewの行列固定（Grid.js）</h2>
    <asp:GridView ID="GridView3" runat="server" CellPadding="5" 
        GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="Check Box">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("CheckBox") %>' />
                </ItemTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Column1" HeaderText="Column1"/>
            <asp:BoundField DataField="Column2" HeaderText="Column2"/>
            <asp:BoundField DataField="Column3" HeaderText="Column3"/>
            <asp:BoundField DataField="Column4" HeaderText="Column4"/>
            <asp:BoundField DataField="Column5" HeaderText="Column5"/>
            <asp:BoundField DataField="Column6" HeaderText="Column6"/>
            <asp:BoundField DataField="Column7" HeaderText="Column7"/>
        </Columns>
    </asp:GridView>
    <asp:TextBox ID="TextBox3" runat="server" Height="100px" TextMode="MultiLine" 
        Width="200px"></asp:TextBox>

</form>

    <%--プラグイン読み込み--%>
    <script src="Scripts/superTables.js" type="text/javascript"></script>
    <script src="Scripts/jquery.tablefix_1.0.0.js" type="text/javascript"></script>
    <script src="Scripts/Grid.js" type="text/javascript"></script>
    <%--テーブル固定の実装--%>
    <script type="text/javascript">
    //<![CDATA[
        //superTables.jsの呼び出し
        (function () {
            //GridViewが空のdivを吐き出すので、親divにクラスを設定
            $('#GridView1').parent("div").addClass("fakeContainer");
            new superTable("GridView1", {
                cssSkin: "sDefault",
                headerRows: 1,
                fixedCols: 1
            });
        })();

        //jquery.tablefix_1.0.0.jsの呼び出し
        (function () {
            $('#GridView2').tablefix({ width: 600, height: 150, fixRows: 1, fixCols: 1 });
        })();
        
        //Grid.jsの呼び出し
        (function () {
            //GridViewが空のdivを吐き出すので、親divにクラスを設定
            $('#GridView3').parent("div").addClass("fakeContainer");
            //IDが必要なので付与
            $('#GridView3').parent("div").attr( "id", "myGrid" );
            new Grid("myGrid", {
                srcType: "dom",
                srcData: "GridView3",
                fixedCols: 1
            });
        })();

    //]]>
    </script>

</body>
</html>
