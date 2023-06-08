using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class page3 : System.Web.UI.Page
{
    string myuserid;
    protected void Page_Load(object sender, EventArgs e)
    {
       myuserid = Session["USERNAME"].ToString();
        this.getuser();
        
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT [SERIALNO], [STATUS], [AMOUNT], [DATE], [USERNAME] FROM POSTABLE WHERE [USERNAME] = @USERNAME", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Parameters.AddWithValue("USERNAME", userid.Text.ToString());
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        gv.DataSource = dt;
                        gv.DataBind();
                    }

                }

            }
        }
       
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string addDate = System.DateTime.Today.ToLongDateString() + " " + System.DateTime.Today.ToLongTimeString();
        string constring = ConfigurationManager.ConnectionStrings["Constring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        { 
            using (SqlCommand cmd = new SqlCommand("INSERT INTO POSTABLE (STATUS, AMOUNT, DATE, USERNAME) VALUES (@STATUS, @AMOUNT, @DATE, @USERNAME)", con))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("STATUS", DropDownList1.Text.ToString());
                cmd.Parameters.AddWithValue("AMOUNT", AMOUNT.Text.ToString());
                cmd.Parameters.AddWithValue("DATE", addDate);
                cmd.Parameters.AddWithValue("USERNAME", userid.Text.ToString());
                
                con.Open();
                int rowsaffected = cmd.ExecuteNonQuery();
                Response.Write("<script>alert('SUBMITTED SUCCESSFULL!');");
                Response.Write("window.location='DASHBOARD.aspx'</script>");
                con.Close();
            }
        }
    }
   public void getuser()
   {

       string constring = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT [USERNAME],[FULLNAME] FROM REGISTER WHERE USERNAME ='" + myuserid.ToString() + "'", con))
            {
                cmd.CommandType = CommandType.Text;
               
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
               if (sdr.HasRows == true)
                {
                    sdr.Read();
                    userid.Text = sdr["USERNAME"].ToString();
                    lblname.Text = sdr["FULLNAME"].ToString();
                }
               
                con.Close();
                  

            }
        }
   }
}