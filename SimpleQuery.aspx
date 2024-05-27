<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SimpleQuery.aspx.cs" Inherits="Ugda162.SimpleQuery" %>
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
          function detectField() {
        if (document.getElementById("field").value == "gender") {
            document.getElementById("query").innerHTML =
                "<input type='radio' name='value' value='male' checked='checked' />זכר" +
                "<input type='radio' name='value' value='female' />נקבה";
        }
        else {
            if (document.getElementById("field").value == "yearBorn") {
                var yearStr = "<select name ='value'><option value='0'>בחר שנה</option>";
                var currYear = new Date().getFullYear();
                var fromYear = currYear - 40;
                var toYear = currYear - 10;

                for (var i = fromYear; i < toYear; i++) { 
                    yearStr += "<option value ='" + i + "'>" + i + "</option>\n";
                }
                document.getElementById("query").innerHTML = yearStr + "</select>";
            }
            else {
                if (document.getElementById('field').value == "perfix") {
                    var prefixStr = "<select name='value'>";

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

                    document.getElementById("query").innerHTML = prefixStr;
                }
                else {
                    if (document.getElementById('field').value == "hobby") {
                        var hobbyStr = "<select name='value'>";

                        hobbyStr += "<option value='1'>כדורגל</option>";
                        hobbyStr += "<option value='2'>כדורסל</option>";
                        hobbyStr += "<option value='3'>ריקוד</option>";
                        hobbyStr += "<option value='4'>טניס</option>";
                        hobbyStr += "<option value='5'>פוצ'יוולי</option>";
                        hobbyStr += "</select>";

                        document.getElementById("query").innerHTML = hobbyStr;
                    }
                    else
                        document.getElementById("query").innerHTML = "<input type ='text' name='value' />";
                }
            }
        }

    }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <center>
   <h1>הצגת נתונים לפי חתך</h1>
   <form method="post" runat="server">
    <select name ="field" id="field" onclick="detectField();" >
        <option value="lName">שם משפחה</option>
        <option value="fName">שם פרטי</option>
        <option value="email">דוא'ל</option>
        <option value="gender">מגדר</option>
        <option value="yearBorn">שנת לידה</option>
        <option value="perfix">קידומת טלפון</option>
        <option value="phone">טלפון</option>
        <option value="hobby">תחביב</option>
    </select>
    <div id="query"></div>
    <br /><br />
    <input type="submit" name="submit" value="send" />
   </form>
 </center>
 <table border="1" style="margin: 0px auto";">
    <%= st %>
 </table>
 <h2><%=sqlSelect %></h2>
 <h3><%= msg %></h3>
</asp:Content>
