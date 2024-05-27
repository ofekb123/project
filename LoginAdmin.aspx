<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="Ugda162.LoginAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
     table{margin: 0px auto; border: 1px solid black}
    h1{
     color: navy;
     text-align: center;
     font-family: 'Guttman Yad-Brush';
    }
    </style>
    <script>
     var backB1 = "pics/backButton1.png";
     var backB2 = "pics/backButton2.png";
     var backB3 = "pics/backButton3.png";
     setInterval("switchF()", 300);

     function show(str) {
        pic.src = str;
     }

     var i = 1;
     function switchF()
     {
        j = i % 3;
        switch (j) {
            case 0: show(backB1); break;
            case 1: show(backB2); break;
            case 2: show(backB3); break;
        }
        i++ 
     }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form method="post" runat="server">
       <center>
        <table id="table1" dir="rtl">
          <tr>
              <td>שם מנהל: </td>
              <td><input type="text" name="mName" id="mName" /></td>
          </tr>
          <tr>
              <td>סיסמה: </td>
              <td><input type="password" name="pw" id="pw" /></td>
          </tr>
          <tr>
              <td colspan="2" style="text-align: center">
                  <input type="submit" name="submit" value ="log in" />
              </td>
          </tr>
        </table>
       </center>
      </form>
      <h3><%=msg %></h3>
</asp:Content>
