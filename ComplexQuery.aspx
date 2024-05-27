<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ComplexQuery.aspx.cs" Inherits="Ugda162.ComplexQuery" %>
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
   <script>
    function detectField1() {
        if (document.getElementById("field1").value == "gender") {
            document.getElementById("query1").innerHTML =
                "<input type='radio' name='value1' value='male' checked='checked' />זכר" +
                "<input type='radio' name='value1' value='female' />נקבה";
        }
        else {
            if (document.getElementById("field1").value == "yearBorn" ||
                document.getElementById("field1").value == "yearFrom") {
                var yearStr = "<select name ='value1'><option value='0'>בחר שנה</option>";
                var currYear = new Date().getFullYear();
                var fromYear = currYear - 40;
                var toYear = currYear - 10;

                for (var i = fromYear; i < toYear; i++) {
                    yearStr += "<option value ='" + i + "'>" + i + "</option>\n";
                }
                document.getElementById("query1").innerHTML = yearStr + "</select>";
            }
            else {
                if (document.getElementById('field1').value == "perfix") {
                    var prefixStr = "<select name='value1'>";

                    prefixStr += "<option value = '050'>050</option>";
                    prefixStr += "<option value = '052'>052</option>";
                    prefixStr += "<option value = '054'>054</option>";
                    prefixStr += "<option value = '057'>057</option>";
                    prefixStr += "<option value = '077'>077</option>";
                    prefixStr += "<option value = '03'>03</option>";
                    prefixStr += "<option value = '02'>02</option>";
                    prefixStr += "<option value = '04'>04</option>";
                    prefixStr += "<option value = '08'>08</option>";
                    prefixStr += "<option value = '09'>09</option>";

                    prefixStr += "</select>";

                    document.getElementById("query1").innerHTML = prefixStr;
                }
                else {
                    if (document.getElementById('field1').value == "hobby") {
                        var hobbyStr = "<select name='value1'>";

                        hobbyStr += "<option value='1'>כדורגל</option>";
                        hobbyStr += "<option value='2'>כדורסל</option>";
                        hobbyStr += "<option value='3'>ריקוד</option>";
                        hobbyStr += "<option value='4'>טניס</option>";
                        hobbyStr += "<option value='5'>פוצ'יוולי</option>";
                        hobbyStr += "</select>";

                        document.getElementById("query1").innerHTML = hobbyStr;
                    }
                    else
                        document.getElementById("query1").innerHTML = "<input type ='text' name='value1' />";
                }
            }
        }
    }

    function detectField2() {
        if (document.getElementById("field2").value == "gender") {
            document.getElementById("query2").innerHTML =
                "<input type='radio' name='value2' value='male' checked='checked' />זכר" +
                "<input type='radio' name='value2' value='female' />נקבה";
        }
        else {
            if (document.getElementById("field2").value == "yearBorn" ||
                document.getElementById("field2").value == "yearFrom") {
                var yearStr = "<select name ='value2'><option value='0'>בחר שנה</option>";
                var currYear = new Date().getFullYear();
                var fromYear = currYear - 40;
                var toYear = currYear - 10;

                for (var i = fromYear; i < toYear; i++) {
                    yearStr += "<option value ='" + i + "'>" + i + "</option>\n";
                }
                document.getElementById("query2").innerHTML = yearStr + "</select>";
            }
            else {
                if (document.getElementById('field2').value == "perfix") {
                    var prefixStr = "<select name='value2'>";

                    prefixStr += "<option value = '050'>050</option>";
                    prefixStr += "<option value = '052'>052</option>";
                    prefixStr += "<option value = '054'>054</option>";
                    prefixStr += "<option value = '057'>057</option>";
                    prefixStr += "<option value = '077'>077</option>";
                    prefixStr += "<option value = '03'>03</option>";
                    prefixStr += "<option value = '02'>02</option>";
                    prefixStr += "<option value = '04'>04</option>";
                    prefixStr += "<option value = '08'>08</option>";
                    prefixStr += "<option value = '09'>09</option>";

                    prefixStr += "</select>";

                    document.getElementById("query2").innerHTML = prefixStr;
                }
                else {
                    if (document.getElementById('field2').value == "hobby") {
                        var hobbyStr = "<select name='value2'>";

                        hobbyStr += "<option value='1'>כדורגל</option>";
                        hobbyStr += "<option value='2'>כדורסל</option>";
                        hobbyStr += "<option value='3'>ריקוד</option>";
                        hobbyStr += "<option value='4'>טניס</option>";
                        hobbyStr += "<option value='5'>פוצ'יוולי</option>";
                        hobbyStr += "</select>";

                        document.getElementById("query2").innerHTML = hobbyStr;
                    }
                    else
                        document.getElementById("query2").innerHTML = "<input type ='text' name='value2' />";
                }
            }
        }
    }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br />
<center>
    <h1>הצגת משתמשים רשומים המקיימים תנאי אחד או שני תנאים</h1>
    <form id="Form1" method="post" runat="server">
        <table border ="1">
            <tr>
                <td style="width:20px;">
                    <select name="field1" id="field1" onclick="detectField1();" >
                        <option value="lName">שם משפחה</option>
                        <option value="fName">שם פרטי</option>
                        <option value="email">דוא'ל</option>
                        <option value="gender">מגדר</option>
                        <option value="yearBorn">שנת לידה</option>
                        <option value="yearFrom">משנה</option>
                        <option value="perfix">קידומת טלפון</option>
                        <option value="phone">טלפון</option>
                        <option value="hobby">תחביב</option>
                    </select> 
                </td>
                <td style="width: 150px;">
                    <div id="query1" style="text-align: center;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; direction: ltr;">
                    <input type="radio" name="op" value="and" checked="checked" />AND
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="op" value="or" />OR
                </td>
            </tr>
            <tr>
                <td style="width:20px;">
                    <select name="field2" id="field2" onclick="detectField2();" >
                        <option value="lName">שם משפחה</option>
                        <option value="fName">שם פרטי</option>
                        <option value="email">דוא'ל</option>
                        <option value="gender">מגדר</option>
                        <option value="yearBorn">שנת לידה</option>
                        <option value="yearFrom">משנה</option>
                        <option value="perfix">קידומת טלפון</option>
                        <option value="phone">טלפון</option>
                        <option value="hobby">תחביב</option>
                    </select> 
                </td>
                <td style="width: 150px;">
                    <div id="query2" style="text-align: center;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" name="submit" value="send" />
                </td>
            </tr>
        </table>
    </form>
</center>
<h2 style="text-align: center; direction: ltr">
    <%= sqlSelect %>
</h2>
<table border="1" style="margin: 0px auto";">
    <%= st %>
</table>
<h3><%=msg %></h3>
</asp:Content>
