using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class page2 : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Btnlogin_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT [USERNAME], [PASSWORD] FROM REGISTER WHERE USERNAME = @USERNAME AND PASSWORD = @PASSWORD", con))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("USERNAME ", USERNAME.Text.ToString());
                cmd.Parameters.AddWithValue("PASSWORD", PASSWORD.Text.ToString());
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows == true)
                {
                    sdr.Read();
                   
                    user.Text = sdr["USERNAME"].ToString();
                   // Session["USERNAME"] = user.Text;
                     Session["USERNAME"] =user.Text ;
                     
                    Response.Write("<script>alert('LOGIN SUCCESSFULL!');");
                    Response.Write("window.location='DASHBOARD.aspx'</script>");
                }
                else 
                {
                    Response.Write("<script>alert('USERNAME OR PASSWORD NOT FOUND')</script>");
                }
                con.Close();
                  

            }
        }
    }
}