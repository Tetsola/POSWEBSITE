<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LOGINPAGE.aspx.cs" Inherits="page2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN PAGE</title>
    
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style>
        img
        {
            display:block;
            width:25%;
            margin-left:auto;
            margin-right:auto;}
            .header
            {width:100%;
             height:75px;
             
             background-color:Aqua;
             position:relative;
             bottom: 10px;
            }
            div h1
            { text-align:center;
              font-size:25px;
              padding: 10px;
              position: relative;
              top:15px;
                }
    </style>
    
</head>
<body>
<div class="header">
<h1 >LOG INTO YOUR ACCOUNT</h1>
</div>
<div class="imgcontainer">
<img src="userimage.jpg" alt="Avatar" class="avatar">
    </div>

    <div ><span style="color:green">NEW USER?</span> <a href=SIGNUPPAGE.aspx><span style="color:red">CREATE AN ACCOUNT TODAY<span></a></div><br /><br />

    <div class="container">
    <form id="form1" runat="server">
    
    <div>
    <label for="USERNAME"><b>USERNAME</b></label>
    <asp:TextBox ID="USERNAME" runat="server" required="true" placeholder="ENTER USERNAME" ></asp:TextBox> <br /> <br /> 
    <label for="PASSWORD"><b>PASSWORD</b></label>
    <asp:TextBox ID="PASSWORD" runat="server" TextMode="Password" ToolTip="ENTER PASSWORD"></asp:TextBox> <br /> <br /> 
        <asp:Button ID="Btnlogin" runat="server" Text="LOGIN" 
            onclick="Btnlogin_Click" /><br />
            <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    
    </div>
    
    <asp:Label ID="user" runat="server" Text="" hidden="true"></asp:Label>
    </form>
</body>
</html>
