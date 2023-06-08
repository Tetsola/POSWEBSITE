<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page1.aspx.cs" Inherits="page1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SIGNUP PAGE</title>
    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Style the horizontal ruler */
hr {
  border: 1px solid blue;
  margin-bottom: 25px;}
  
  /* Add padding to container elements */
.container {
  padding: 16px;
}
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;}
  
  .signupbtn {
  padding: 14px 20px;
  background-color: #green;}
  
  /* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;}
  
  .cancelbtn:hover, .sigupbtn:hover
  {
      cursor:pointer;
      }
      
      #PHONENO
      { width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
  font-size:medium;
          
          }


/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;}
  
  input[type=text], input[type=password], input[type=date], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
  font-size:medium;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <h1>Sign Up</h1>
      <p>complete sign up by filling the input field below</p>
      <hr>
        <asp:Label ID="FLLNAME" runat="server" for="FULLNAME"><b>FULLNAME</b></asp:Label><br/>
        <asp:TextBox ID="FULLNAME" required="true" runat="server"></asp:TextBox><br /><br />

        <asp:Label ID="USNAME" runat="server" for="USERNAME"><b>USERNAME</b></asp:Label><br />
        <asp:TextBox ID="USERNAME" runat="server" required="true" ></asp:TextBox><br /><br />

        <asp:Label ID="DATE" for="SIGNUPDATE" runat="server"><b>DATE</b></asp:Label><br />
        <asp:TextBox ID="SIGNUPDATE" runat="server" required="true" TextMode="Date"></asp:TextBox><br /><br />

        <asp:Label ID="PHONEN0" runat="server" for="phone"  ><b>PHONENO</b></asp:Label><br />
        <asp:TextBox ID="PHONENO" runat="server" required="true" TextMode="Number" ToolTip="ENTER PHONENO" name="phone" ></asp:TextBox><br /><br />

        <label for="PASSWORD"><b>CREATE NEW PASSWORD</b></label><br />
        <asp:TextBox ID="PASSWORD" runat="server" TextMode="Password" ToolTip="ENTER PASSWORD"></asp:TextBox><br /><br />

         <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
         <div class="clearfix">
        <button type="button"  class="cancelbtn">Cancel</button>
        <asp:Button ID="Btnsubmit" runat="server" Text="Sign Up" class="signupbtn" style="background-color:Green"
            onclick="Btnsubmit_Click"/>
    </div>
    <asp:Label ID="Lbl1" runat="server" Text=" "></asp:Label>
    </form>
</body>
</html>
