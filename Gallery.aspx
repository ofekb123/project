<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Ugda162.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .h1Gal{
        color: navy;
        text-align: center;
        font-family: 'Guttman Yad-Brush';
        margin-top: 5px;
    }
    .imgCell{width: 230px; height: 180px; border: 1px solid gray;}
    .bigPicImg{width: 480px; height: 380px; border: 1px solid gray;}
    h1{
        color: navy;
        text-align: center;
        font-family: 'Guttman Yad-Brush';
    }
</style>
<script>
    function picShow(picSrc) {
        bigPic.src = picSrc;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="h1Gal">גלריית תמונות</h1>
<table style="margin: 0px auto;">
    <tr>
        <td>
        <img class="imgCell" src="pics/pic1.png" onmouseover="picShow('pics/pic1.png')" onmouseout="picShow('pics/pic8.png')" /></td>
        <td>
            <img class="imgCell" src="pics/pic2.png" onmouseover="picShow('pics/pic2.png')" onmouseout="picShow('pics/pic8.png')" /></td>
        <td>
                <img class="imgCell" src="pics/pic3.png" onmouseover="picShow('pics/pic3.png')" onmouseout="picShow('pics/pic8.png')"/></td>
        <td>
                    <img class="imgCell"src="pics/pic4.png" onmouseover="picShow('pics/pic4.png')" onmouseout="picShow('pics/pic8.png')"/></td>
    </tr>
    <tr>
        <td>
                        <img class="imgCell" src="pics/pic5.png" onmouseover="picShow('pics/pic5.png')" onmouseout="picShow('pics/pic8.png')" /></td>
        <td rowspan="2" colspan="2">
            <img class="bigPicImg" id="bigPic" src ="pics/pic8.png" />
        </td>
        <td>
                            <img class="imgCell" src="pics/pic7.png" onmouseover="picShow('pics/pic7.png')" onmouseout="picShow('pics/pic8.png')" /></td>
    </tr>
    <tr>
        <td>
                                <img class="imgCell" src="pics/pic6.png" onmouseover="picShow('pics/pic8.png')" onmouseout="picShow('pics/pic8.png')" /></td>
        <td>
                                    <img class="imgCell" src="pics/pic9.png" onmouseover="picShow('pics/pic9.png')" onmouseout="picShow('pics/pic8.png')" /></td>
    </tr>
    <tr>
        <td>
                                        <img class="imgCell" src="pics/pic10.png" onmouseover="picShow('pics/pic10.png')" onmouseout="picShow('pics/pic8.png')" /></td>
        <td>
                                            <img class="imgCell" src="pics/pic11.png" onmouseover="picShow('pics/pic11.png')" onmouseout="picShow('pics/pic8.png')" /></td>
        <td>
                                                <img class="imgCell" src="pics/pic12.png" onmouseover="picShow('pics/pic12.png')" onmouseout="picShow('pics/pic8.png')" /></td>
        <td>
                                                    <img class="imgCell" src="pics/pic13.png" onmouseover="picShow('pics/pic13.png')" onmouseout="picShow('pics/pic8.png')" /></td>
    </tr>

</table>
</asp:Content>
