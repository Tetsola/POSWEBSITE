using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class page1 : System.Web.UI.Page
{
        
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btnsubmit_Click(object sender, EventArgs e)
    {
        
 string constring = ConfigurationManager.ConnectionStrings["Constring"].ConnectionString;
    using (SqlConnection con = new SqlConnection(constring))
     {
         using (SqlCommand cmd = new SqlCommand("SELECT [USERNAME] FROM REGISTER WHERE USERNAME = @USERNAME", con))
         {
             cmd.CommandType = CommandType.Text;
             cmd.Parameters.AddWithValue("USERNAME", USERNAME.Text.ToString());
             con.Open();
             SqlDataReader sdr = cmd.ExecuteReader();
             if (sdr.HasRows == true)
             {
                 Response.Write("<script>alert('USERNAME ALREADY IN USE!');</script>");
             }
             else
             {
                 this.getuername();
             }
         }

     }

        
    }
    public void getuername()
    {
        string ReggDate;
        ReggDate = System.DateTime.Today.ToLongDateString() + " " + System.DateTime.Today.ToLongTimeString();
        string constring = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO REGISTER (FULLNAME, USERNAME, SIGNUPDATE, PHONENO, PASSWORD,RegDate) VALUES(@FULLNAME, @USERNAME, @SIGNUPDATE, @PHONENO, @PASSWORD, @RegDate)", con))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@FULLNAME", FULLNAME.Text.ToString());
                cmd.Parameters.AddWithValue("@USERNAME", USERNAME.Text.ToString());
                cmd.Parameters.AddWithValue("@SIGNUPDATE", SIGNUPDATE.Text.ToString());
                cmd.Parameters.AddWithValue("@PHONENO", PHONENO.Text.ToString());
                cmd.Parameters.AddWithValue("@PASSWORD", PASSWORD.Text.ToString());
                cmd.Parameters.AddWithValue("@RegDate", ReggDate);
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                Response.Write("<script>alert('registeration is successfull!'); ");
                Response.Write("window.location='LOGINPAGE.aspx'</script>");
                

            }
            con.Close();
        }
        
       }
}
