<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShowTable.aspx.cs" Inherits="Ugda162.ShowTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
        h1 {color: red; text-align: center;}
        h2 {text-align: center;}
        h3 {text-align: center; direction: ltr;}
        .tableDB {border: 1px solid black; margin: 0px auto;}
        .tblTH {text-align: center; border: 1px solid black;}
        .tblTD1 {border: 1px solid black; text-align: center;}
        .tblTD2 {border: 1px solid black; text-align: right }
        .tblTD3 {border: 1px solid black; text-align: right;}
       </style>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>טופס רישום</h1>
    <h2><%=sqlSelect %></h2>
    <table style ="border: 1px solid black; margin: 0px auto;">
        <%= st %>
    </table>
    <h3><%= msg %></h3>
</asp:Content>
