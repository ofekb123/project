<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Ugda162.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    .loginTable{margin: 0px auto; direction: rtl; text-align: center; border: 2px solid black; border-radius: 5px}
    h1{text-align: center}
    h3{text-align: center; margin: 0px auto;}
    .title{font-size: 25pt;}
    input{font-size: 25pt; border-block-color: black}
    .button{font-size: 30pt; border-radius: 5px; background-color: blue; font-family: Arial; color: white}
    .button:hover{background-color: aqua; color: black}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" runat="server">
    <h1>כניסת משתמש</h1>
    <table class="loginTable">
        <tr>
            <td class="title">שם משתמש: </td>
            <td><input type="text" name="uName" id="uName" /></td>
        </tr>
        <tr>
            <td  class="title">סיסמה: </td>
            <td><input type="password" name="pw" id="pw" /></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
            <input class="button" type ="submit" name="submit" value="log In"/>
            </td>
        </tr>
    </table>
</form>

<br /><h3><%=msg %></h3>
</asp:Content>
