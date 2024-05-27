<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="Ugda162.Survey" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
    h1{
        color: navy;
        text-align: center;
        font-family: 'Guttman Yad-Brush';
    }
    .tableIn{margin: 0px auto;}
    .td1{width: 100px; padding-right: 10px;}
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table class="tableOut">
         <tr>
            <td>
                <form id="form1"; method="post" >
                    <table class="tableIn" border="1">
                        <tr><th style="text-align:center;" colspan="2">אם היית משרת באוגדה, באיזו חטיבה היית רוצה לשרת? </th></tr>
                        <tr>
                            <td class="td1">גבעתי</td>
                            <td><input type="radio" name="surv" value="1" checked /></td>
                        </tr>
                        <tr>
                            <td class="td1">נח"ל</td>
                            <td><input type="radio" name="surv" value="2" /></td>
                        </tr>
                        <tr>
                            <td class="td1">חטיבה 401</td>
                            <td><input type="radio" name="surv" value="3" /></td>
                        </tr>
                        <tr>
                            <td class="td1">חטיבה 5</td>
                            <td><input type="radio" name="surv" value="4" /></td>
                        </tr>
                        <tr>
                            <td class="td1">חטיבה 215</td>
                            <td><input type="radio" name="surv" value="5" /></td>
                        </tr>
                        <tr>
                            <td class="td1">אלו"ג 6162</td>
                            <td><input type="radio" name="surv" value="6" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2">
                                <input type ="submit" name="send" value="הצג" />
                            </td> 
                        </tr>
                    </table>
                </form>
            </td>
            <td style="width: 600px; text-align:center;"><%=survay %></td>
         </tr>
    </table>
</asp:Content>
