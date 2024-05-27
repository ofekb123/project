<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignUpForm.aspx.cs" Inherits="Ugda162.SignUpForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
       h1{text-align: center; color: white;}
       h3{text-align:center; font-size:16pt; font-family: 'Comic Sans MS'; font-weight: bold}
       input{padding: 10px 50px; margin: 4px 2px; cursor: pointer; border: 2px black solid; text-align: center;}
       .formTable{margin: 0px auto; border: 2px double black; border-radius:15px;}
       .title{font-size: 15px; font-family: 'Guttman Yad-Brush';}
       .header{background-color: black; width: 500px; margin: 0px auto; border-radius:10px;}
       .formTable1{background-color: gray; width: 500px; margin: 0px auto; border-radius:10px;}
   </style>
   <script>
       function chkForm() {
           var uName = document.getElementById("uName").value;
           //alert("username: " + uName);
           if (uName.length < 2) {
               document.getElementById("mUName").value = "שם משתמש קצר מידי או לא קיים";
               document.getElementById("mUName").style.display = "inline";
               return false;
           }
           else
               document.getElementById("mUName").style.display = "none";

           var fName = document.getElementById("fName").value;
           //alert("first name: " + fName);
           if (fName.length < 2) {
               document.getElementById("mFName").value = "שם פרטי קצר מידי או לא קיים";
               document.getElementById("mFName").style.display = "inline";
               return false;
           }
           else
               document.getElementById("mFName").style.display = "none";

           var lName = document.getElementById("lName").value;
           //alert("last name: " + lName);
           if (lName.length < 2) {
               document.getElementById("mLName").value = "שם משפחה קצר מידי או לא קיים";
               document.getElementById("mLName").style.display = "inline";
               return false;
           }
           else
               document.getElementById("mLName").style.display = "none";



           var email = document.getElementById("email").value;
           var size = email.length;
           var at = email.indexOf('@')
           var dot = email.indexOf('.', at);

           //alert("email: " + email);
           //alert("size " + size);
           //alert("at index: " + at);
           //alert("dot index: " + dot);
           var msg = "";

           if (size < 6 || size > 40)
               msg = "כתובת דואל קצרה מידי או ארוכה מידי";

           else if (at == -1)
               msg = "כתובת דוא'ל חייבת לכלול @ אחד";

           else if (email.lastIndexOf('@') != at)
               msg = "אסור שיהיה יותר מסימן @ אחד בדוא'ל";
           else if (at < 2)
               msg = "שם משתמש בכתובת דוא'ל חייב להיות לפחות 2 תווים ";
           else if (at == size - 1)
               msg = "ה- @ לא יכול להיות אחרון בכתובת";

           else if (dot == -1)
               msg = "כתובת דוא'ל חייבת לכלול נקודה אחרי ה @";

           else if (dot - at < 2)
               msg = "@ - הנקודה קרובה מידי ל";

           else if (dot == size - 1)
               msg = "נקודה לא יכולה להופיע כתו ראשון או אחרון";
           else if (isQuot(email))
               msg = "כתובת הדוא'ל לא יכולה להכיל גרש או גרשיים";
           else if (isHebrew(email))
               msg = "כתובת דוא'ל לא יכולה לכלול תווים בעברית";
           else if (isValidString(email))
               msg = "כתובת דוא'ל לא יכולה להכיל תוים אסורים";


           if (msg != "") {
               document.getElementById("mEmail").value = msg;
               document.getElementById("mEmail").style.display = "inline";
               return false;
           }
           else
               document.getElementById("mEmail").style.display = "none";


           //---בדיקת נקודה אחרי @  

           msg = "";
           var dot = email.indexOf('.', at);
           //alert("at= " + at + "\ndot= " + dot);

           if (dot == -1)
               msg = "כתובת דוא'ל חייבת לכלול נקודה";

           else if (dot - at < 2)
               msg = "- @הנקודה קרובה מידי ל";

           else if (dot == size - 1)
               msg = "נקודה לא יכולה להופיע כתו ראשון או אחרון";
           else if (isQuot(email))
               msg = "כתובת הדוא'ל לא יכולה להכיל גרש או גרשיים";
           else if (isHebrew(email))
               msg = "כתובת דוא'ל לא יכולה לכלול תווים בעברית";
           else if (isValidString(email))
               msg = "כתובת דוא'ל לא יכולה להכיל תוים אסורים";


           //--- בדיקת תקינות יישוב מגורים ---
           msg = "";
           var city = document.getElementById("city").value;
           //alert(city);
           if (city == "other") {
               msg = "יש לבחור יישוב או אזור מגורים";
               document.getElementById("mCity").value = msg;
               document.getElementById("mCity").style.display = "inline";

               return false;
           }
           else
               document.getElementById("mCity").style.display = "none";


           //בדיקת תקינות לאורך מספר טלפון (ללא קידומת)
           var phoneMSG = "";
           var phone = document.getElementById("phoneNum").value;

           //checks if phone number has exactly 7 digits
           if (phone.length != 7)
               phoneMSG = "מספר טלפון חייב להכיל בדיוק 7 ספרות";
           //checks if phone number has only digits
           if (isNaN(phone))
               phoneMSG = "מספר טלפון חייב להכיל ספרות בלבד";

           //Placing the value in phone msg
           if (phoneMSG != "") {
               document.getElementById("mPhone").value = phoneMSG;
               document.getElementById("mPhone").style.display = "inline";
               return false;
           }
           else
               document.getElementById("mPhone").style.display = "none";


           // בדיקת אורך סיסמא
           var password = document.getElementById("pw").value;
           var size = password.length;
           if (size < 6 || size > 10) {
               msg = "על הסיסמא להיות בין 6 ל10 תווים";
           }
           else if (isQuotPassword(password))
               msg = "סיסמה אינה יכולה להכיל גרש או גרשיים";

           //checks if there's bad chars in password
           else if (isValidStringPassword(password))
               msg = "סיסמה לא יכולה להכיל תווים אסורים";

           //checks if there's hebrew chars in password
           else if (isHebrewPassword(password))
               msg = "סיסמה לא יכולה להכיל עברית";

           if (msg != "") {
               document.getElementById("mPw").value = msg;
               document.getElementById("mPw").style.display = "inline";
               return false;
           }
           else
               document.getElementById("mPw").style.display = "none";

           // בדיקת שוויון בין הסיסמאות
           var password = document.getElementById("pw").value;
           var passwordC = document.getElementById("pwC").value;
           //alert(password)
           //alert(passwordC)
           if (password != passwordC) {
               msg = "סיסמת האימות צריכה להיות זהה לסיסמא הרגילה";
           }
           if (msg != "") {
               document.getElementById("mPwC").value = msg;
               document.getElementById("mPwC").style.display = "inline";
               return false;
           }
           else
               document.getElementById("mPwC").style.display = "none";

       }

       function isQuot(email) {
           //alert("email= " + email)
           var quot = '\"', quot1 = "\'";
           if (email.indexOf(quot) != -1 || email.indexOf(quot1) != -1)
               return true;
           return false;
       }
       function isHebrew(email) {
           var len = email.length;
           var i = 0, ch;
           while (i < len) {
               ch = email.charAt(i);
               if (ch >= "א" && ch <= "ת")
                   return true;
               i++;
           }
           return false;


       }
       function isValidString(email) {
           var badChar = "#=+~;/,'$% ^&*()-![]{}<>?";
           var len = email.length;

           var i = 0, pos, ch;
           while (i < len) {
               ch = email.charAt(i);
               pos = badChar.indexOf(ch);
               if (pos != -1)
                   return true;
               i++;
           }
           return false;

       }

       function isValidStringPassword(password) {
           var badChr = "~@#;:,'$%^&*()-! []{}<>?";
           var len = password.length;

           var i = 0, pos, ch;
           while (i < len) {
               ch = password.charAt(i);
               pos = badChr.indexOf(ch);
               if (pos != -1)
                   return true;
               i++;
           }
           return false;
       }
       function isQuotPassword(password) {
           var quot = '\"', quot1 = "\'";
           if (password.indexOf(quot) != -1 || password.indexOf(quot1) != -1)
               return true;
           return false;
       }

       function isHebrewPassword(password) {
           var len = password.length;
           var i = 0, ch;
           while (i < len) {
               ch = password.charAt(i);
               if (ch >= 'א' && ch <= 'ת')
                   return true;
               i++;
           }
           return false;
       }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" runat="server" onsubmit="return chkForm();" >
    <br />
    <table class="formTable">
        <tr>
            <td class="header" colspan="2">
                <h1>טופס רישום</h1>
            </td>
        </tr>
        <tr>
            <td class="title">שם משתמש: </td>
            <td>
                <input type="text" id ="uName" name="uName" class="input"/>
            </td >
            <td>
                <input type="text" id="mUName" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                    disabled="disabled" />
            </td>
        </tr>
         <tr>
            <td class="title">שם פרטי: </td>
            <td>
                <input type="text" id ="fName" name="fName" class="input"/>
            </td>
            <td>
                <input type="text" id="mFName" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                        disabled="disabled" />
            </td>    
        </tr>
        <tr>
            <td class="title">שם משפחה: </td>
            <td>
                <input type="text" id ="lName" name="lName" class="input"/>
            </td>
            <td>
                <input type="text" id="mLName" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                        disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td class="title">כתובת מייל: </td>
            <td>
                <input type="text" id="email" name="email" class="input" />
            </td>
            <td>
                <input type="text" id="mEmail" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                        disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td class="title">מגדר: </td>
            <td>
                <input type="radio" name="gender" value="male"/>זכר
                <input type="radio" name ="gender" value="female"/>נקבה
            </td>
            <td>
                <input type="text" id="mGender" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                    disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td class="title">מספר טלפון: </td> 
            <td dir ="ltr">
                <select name ="prefix" >
                    <option value ="050">050</option>
                    <option value ="052">052</option>
                    <option value ="053">053</option>
                    <option value ="054">054</option>
                    <option value ="055">055</option>
                    <option value ="057">057</option>
                    <option value ="058">058</option>
                    <option value ="02">02</option>
                    <option value ="03">03</option>
                    <option value ="04">04</option>
                    <option value ="08" selected="selected">08</option>
                    <option value ="09">09</option>
                    <option value ="077">077</option>
                </select>
            
                &nbsp;&nbsp; - &nbsp;&nbsp; 
               <input type ="text" name ="phoneNum" id="phoneNum" />
            </td>
            <td>
                <input type="text" name="mPhone" id ="mPhone" size="30"
                    style="display: none; background-color: silver; font-weight:bold;"
                    disabled ="disabled" />
            </td>
        </tr>
        <tr>
            <td class="title">עיר מגורים: </td>
            <td>
                <select name="city" id="city">
                    <option value="other">בחר יישוב מגורים</option>
                    <option value="חיפה">חיפה</option>
                    <option value="תל אביב">תל אביב</option>
                    <option value="ירושליים">ירושליים</option>
                    <option value="מודיעין">מודיעין</option>
                    <option value="באר שבע">באר שבע</option>
                    <option value="מטולה">מטולה</option>
                    <option value="צפון">צפון</option>
                    <option value="מרכז">מרכז</option>
                    <option value="דרום">דרום</option>
                </select>
            </td>
            <td>
                <input type="text" name="mCity" id="mCity" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                    disabled="disabled" />                    
            </td>
        </tr>
        <tr>
            <td class="title">שנת לידה: </td>
            <td>
                <select name ="yearBorn" id ="yearBorn">
                    <%=yrBorn %>
                </select>
            </td>
            <td> </td>
        </tr>
        <tr>
            <td class="title">תחביבים: </td>
            <td>
                <table style ="width: 550px;">
                    <tr>
                        <td><input type="checkbox" name="hobby" value="1" />כדורגל</td>
                        <td><input type="checkbox" name="hobby" value="2" />כדורסל</td>
                        <td><input type="checkbox" name="hobby" value="3" />ריקוד</td>
                        <td><input type="checkbox" name="hobby" value="4" />טניס</td>
                        <td><input type="checkbox" name="hobby" value="5" />פוצ'יוולי</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="title">סיסמה: </td>
            <td>
                <input type="password" name="passW" id="passW" size="10" />
                <span style="color: red;"> * 6-10 תווים</span>
            </td>
            <td>
                <input type="text" name="mPassword" id="mPassword" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                    disabled="disabled" />               
            </td>
        </tr>
        <tr>
            <td class="title">אימות סיסמה: </td>
            <td>
                <input type="password" name="passWComfirm" id="passWComfirm" size="10" />
                <span style="color: red;"> * 6-10 תווים</span>
            </td>
            <td>
                <input type="text" name="mPasswordCheck" id="mPasswordCheck" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                    disabled="disabled" />               
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center";>
                <input type="submit" name="submit" value="send" />
            </td>
        </tr>       
    </table>
</form>
    <h3><%=msg %></h3>
</asp:Content>
