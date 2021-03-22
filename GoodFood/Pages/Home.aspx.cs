using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFood
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataView dvSql = (DataView)CustomerCountSqlDataSource.Select(DataSourceSelectArguments.Empty);
            //foreach (DataRowView drvSql in dvSql)
            //{
            //    LabelCustomerCount.Text = drvSql["Number Of Customers"].ToString();
            //}

            SqlDataSource smt = (SqlDataSource)FindControl("CustomerCountSqlDataSource");
            DataView dvSql = (DataView)smt.Select(DataSourceSelectArguments.Empty);
            Label lblCountCustomer = (Label)FindControl("LabelCustomer");
            foreach (DataRowView drvSql in dvSql)
            {
                lblCountCustomer.Text = drvSql["Number Of Customers"].ToString();
            }
            //Console.WriteLine(smt.)

            //string displayDataQuery = "SELECT * from dishes";
            ////OracleConnection Con = new OracleConnection(mycon);
            ////Con.Open();
            ////DataTable tab = new DataTable();
            ////OracleDataAdapter da = new OracleDataAdapter(displayDataQuery, Con);
            ////da.Fill(tab);
            ////GridView1.DataSource = tab;
            ////GridView1.DataBind();
            ////Con.Close();
            ////Con.Dispose();

            //EmptyTextValidationException.Visible = false;
            //StringFormatValidationException.Visible = false;
            //PrimaryKeyValidationException.Visible = false;
            //ExceptionsCard.Visible = false;

        }


    }
}