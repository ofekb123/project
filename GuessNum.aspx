<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GuessNum.aspx.cs" Inherits="Ugda162.GuessNum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1{
          color: navy;
          text-align: center;
          font-family: 'Guttman Yad-Brush';
        }
        h3{text-align: center; color: red;}
        h4{text-align: center; color: black;}
    </style>

    <script>
        var num = parseInt(Math.random() * 100) + 1;
        function checkGuess()
        {
            var guess = parseInt(document.getElementById("guess").value);
            var msg;
            if (guess == num)
                msg = "הצלחת! כל הכבוד";
            else if (guess > num)
                msg = "הניחוש שלך גדול מדי";
            else
                msg = "הניחוש שלך קטן מדי";
            document.getElementById("msg").innerHTML = msg;

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>ניחוש מספר</h1>
    <h4>על המשתמש לנסות למצוא את המספר שהוגרל במספר מינימלי של צעדים</h4>

    <div style="text-align: center; direction: rtl;">
        נחש את המספר שלי: <input type="text" id="guess" text-align="center" />
        <br /> <br />
        <input type="button" value="~בדוק את הניחוש שלי~" onclick="checkGuess();" />
        <br />
        <h2 id="msg"></h2>
    </div>
</asp:Content>
