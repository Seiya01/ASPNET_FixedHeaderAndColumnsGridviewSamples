using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class top : System.Web.UI.Page
{
    /// <summary>
    /// ページロード時の処理
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        //ポストバック時はデータ再作成しない
        if ( IsPostBack ) {
            return;
        }

        //データ作成
		//superTables.js用
		//自動的に列が作成されないようにする
		this.GridView1.AutoGenerateColumns = false;
		this.GridView1.DataSource = GetMyDataSource();
		this.GridView1.DataBind();
		//jquery.tablefix_1.0.0.js用
		//自動的に列が作成されないようにする
		this.GridView2.AutoGenerateColumns = false;
		this.GridView2.DataSource = GetMyDataSource();
		this.GridView2.DataBind();

		//Grid.js用
		//自動的に列が作成されないようにする
		this.GridView3.AutoGenerateColumns = false;
		GridView3.UseAccessibleHeader = true;
		this.GridView3.DataSource = GetMyDataSource();
		this.GridView3.DataBind();
		GridView3.HeaderRow.TableSection = TableRowSection.TableHeader;

    }

    /// <summary>
    /// GridView表示用のデータソースの返却
    /// </summary>
    /// <returns></returns>
    private DataTable GetMyDataSource()
    {
        //列の作成
        DataTable dt = new DataTable();
        dt.Columns.Add("CheckBox", typeof(bool));
        dt.Columns.Add("Column1");
        dt.Columns.Add("Column2");
        dt.Columns.Add("Column3");
        dt.Columns.Add("Column4");
        dt.Columns.Add("Column5");
        dt.Columns.Add("Column6");
        dt.Columns.Add("Column7");

        //行の作成（1000件）
        for (int rowIndex = 0; rowIndex < 10; rowIndex++)
        {
            DataRow dr = dt.NewRow();
            dr[0] = (rowIndex % 2 == 0) ? true : false;
            dr[1] = "Column1_" + rowIndex;
            dr[2] = "Column2_" + rowIndex;
            dr[3] = "Column3_" + rowIndex;
            dr[4] = "Column4_" + rowIndex;
            dr[5] = "Column5_" + rowIndex;
            dr[6] = "Column6_" + rowIndex;
            dr[7] = "Column7_" + rowIndex;
            dt.Rows.Add(dr);
        }

        return dt;
    }

    /// <summary>
    /// ボタンクリックイベント
    /// </summary>
    protected void Button1_Click(object sender, EventArgs e)
    {
		//    Grid1    //
		Test_GridValueGet( this.GridView1, this.TextBox1 );
		//    Grid2    //
		Test_GridValueGet( this.GridView2, this.TextBox2 );
		//    Grid3    //
		Test_GridValueGet( this.GridView3, this.TextBox3 );
    }

	private void Test_GridValueGet( GridView gv, TextBox tb ) {
		int rowIndex = 0;
		tb.Text = "";
		foreach( GridViewRow gvr in gv.Rows )
		{
			var checkbox = (CheckBox)gvr.Cells[0].Controls[1];
			if( checkbox.Checked )
			{
				tb.Text += "チェック済:" + rowIndex.ToString() + System.Environment.NewLine;
			}
			rowIndex++;
		}
	}

}