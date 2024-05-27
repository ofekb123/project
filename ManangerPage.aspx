<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManangerPage.aspx.cs" Inherits="Ugda162.ManangerPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <center>
       <%=msg %>
    </center>
</asp:Content>
