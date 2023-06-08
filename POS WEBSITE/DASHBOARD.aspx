<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DASHBOARD.aspx.cs" Inherits="page3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DASHBOARD</title>
    <link rel="stylesheet" href="StyleSheet.css"
    <style>
        *{margin:0;
          padding:0;
          font-family:Arial;}
          
          /* Set a style for all buttons */

  #DropDownList1 
  {
      width:25%;
      height:25px;
      font-size:large;
      margin-top:25px;
      
      }
      #AMOUNT
      { width:25%;
      height:25px;
      font-size:large;
      margin-top:25px;
          
          }
      #gv
      {
          background-color:Teal;
          height: 400px;
          color:Red;
          width:100%}
          
          #Button1 {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 20%;
  opacity: 0.9;}
          
          
  
    
    </style>
</head>
<body>
<HEADER style="font-size:x-large">POS</HEADER>

    <form id="form1" runat="server">
    <h1 style = " color:black; background-color:Silver;">
    <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label> 
    <br />WELCOME TO YOUR DASHBOARD <span style="float:right"><asp:Label ID="userid" runat="server" Text=""></asp:Label></span></h1>
    
    <div>
        
       
        <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>WITHDRAWAL</asp:ListItem>
        <asp:ListItem>TRANSFER</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="AMOUNT" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>

    <div>
    
        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" style="text-align:left"> 
        <Columns>
        <%--<asp:BoundField  DataField="SERIALNO" HeaderText= "SN"/>--%>
        <asp:TemplateField HeaderText="SN">
        <ItemTemplate>
            <asp:Label ID="Lbl1" runat="server" Text='<%#Container.DataItemIndex + 1 %>'></asp:Label>

        
        </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="STATUS" HeaderText="STATUS"  HeaderStyle-Width="1000"  />
        <%--<asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" HeaderStyle-Width="1000" />--%>
         <asp:TemplateField HeaderText="AMOUNT">
        <ItemTemplate>
           &#8358;<asp:Label ID="Lbl2" runat="server" Text='<%# Eval ("AMOUNT", "{0:#,0}") %>'></asp:Label>

        
        </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="DATE" HeaderText="DATE" HeaderStyle-Width="1000" />
      
        </Columns>
        
        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
