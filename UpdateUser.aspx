<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="Ugda162.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cdHob {
            width: 150px; 
            text-align: center;
            background-color: #f2f2f2; 
            border: 1px solid #ccc; 
            padding: 5px; 
            margin: 5px; 
        }
    </style>

    <script>
    /*email validation check functions*/

    //Checking if there is a letter or letters in the email
    function isQuot(email) {
        var quot = '\"', quot1 = "\'";
        if (email.indexOf(quot) != -1 || email.indexOf(quot1) != -1)
            return true;
        return false;
    }

    //Checking if the email contains Hebrew characters
    function isHebrew(email) {
        var len = email.length;
        var i = 0, ch;
        while (i < len) {
            ch = email.charAt(i);
            if (ch >= 'א' && ch <= 'ת')
                return true;
            i++;
        }
        return false;
    }

    //Checks if the email contains unusual characters
    function isValidString(email) {
        var badChr = '$%^&*()-! []{}<>?';
        var len = email.length;

        var i = 0, pos, ch;
        while (i < len) {
            ch = email.charAt(i);
            pos = badChr.indexOf(ch);
            if (pos != -1)
                return true;
            i++;
        }
            return false;
    }

    /*password validation check functions*/

    //Checks if the password contains more than one uppercase letter
    function isUpperCase(password) {
        var len = password.length;
        var i = 0, ch;
        var counter = 0;
        while (i < len) {
            ch = password.charAt(i);
            if (ch >= 'A' && ch <= 'Z')
                counter++
            i++;
        }
        if (counter < 1)
            return true;
        else
            return false;
    }         

    //Checks if the password contains more than one lowercase letter
    function isLowerCase(password) {
        var len = password.length;
        var i = 0, ch;
        var counter = 0;
        while (i < len) {
            ch = password.charAt(i);
            if (ch >= 'a' && ch <= 'z')
                counter++
            i++;
        }
        if (counter < 1)
            return true;
        else
            return false;
    }  

    //Checks if the password contains at least one digit
    function isdigit(password) {
        var len = password.length;
        var i = 0, digit;
        var counter = 0;
        while (i < len) {
            digit = password.charAt(i);
            if (digit >= 0 && digit <= 9)
                counter++
            i++;
        }
        if (counter < 1)
            return true; 
        else
            return false;
    }  

    //Checking if there is a letter or letters in the password
    function isQuotPassword(password) {
        var quot = '\"', quot1 = "\'";
        if (password.indexOf(quot) != -1 || password.indexOf(quot1) != -1)
            return true;
        return false;
    }

    //Checks if the email contains unusual characters
    function isValidStringPassword(password) {
        var badChr = '$%^&*()-! []{}<>?';
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

    //Checking if the password contains Hebrew characters
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


    /* main function */
    function chkForm() {
        //Proper name check: Contains more than 2 characters
        var fName = document.getElementById("fName").value;
        if (fName.length < 2) {
            document.getElementById("mFName").value = "שם פרטי קצר מדי או לא קיים";
            document.getElementById("mFName").style.display = "inline";
            return false;
        }
        else
            document.getElementById("mFName").style.display = "none";



        

        //Validity check of last name: contains more than 2 characters
        var lName = document.getElementById("lName").value;
        if (lName.length < 2) {
            document.getElementById("mLName").value = "שם משפחה קצר מדי או לא קיים";
            document.getElementById("mLName").style.display = "inline";
            return false;
        }
        else
            document.getElementById("mLName").style.display = "none";

            

        //email check list//
        //Defining an email variable and variables associated with it
        var email = document.getElementById("email").value;
        var emailSize = email.length;
        var atSign = email.indexOf('@');
        var dotSign = email.indexOf('.', atSign);



        //massage variavle
        msg = "";

        //checks if the email adress is too short
        if (emailSize < 6)
            msg = "מייל קצר מדי";

        //checks if the email adress is too long
        else if (emailSize > 30)
            msg = "מייל ארוך מדי"

        //check if user name is at least 2 chars
        else if (atSign < 2)
            msg = "שם המשתמש בכתובת הדואל חייב להיות 2 תווים לפחות";

        //check if @ sign is in mail address
        else if (atSign == -1)
            msg = "סימן @ לא קיים בכתובת"

        //checks if there's more than 2 @ signs in mail address
        else if (atSign != email.lastIndexOf('@'))
            msg = "אסור יותר מ-@ אחד בכתובת הדואל";

        //checks if the @ sign isn't in the first or the last place in the mail address
        else if (atSign < 2 || email.lastIndexOf('@') == emailSize - 1)
            msg = "סימן @ לא יכול להיות במקום הראשון או האחרון";

        //checks if . (dot) isn't in the first or the last place in the mail address
        else if (email.indexOf('.') == 0 || email.lastIndexOf('.') == emailSize - 1)
            msg = "נקודה לא יכולה להיות במקום הראשון או האחרון";

        //checks if . (dot) is at least 2 chars after the @ sign
        else if (dotSign - atSign <= 1)
            msg = "נקודה חייבת להיות לפחות 2 תווים אחרי סימן ה-@";

        //checks if mail address has "" or ''
        else if (isQuot(email))
            msg = "כתובת דואל לא יכולה להכיל גרש או גרשיים";

        //checks if there is hebrew chars in mail adress
        else if (isHebrew(email))
            msg = "כתובת דוא'ל לא יכולה להכיל עברית";

        //checks if there is valid string chars in mail adress
        else if (isValidString(email))
            msg = "כתובת דואל לא יכולה להכיל תווים אסורים"
        else
            document.getElementById("mEmail").style.display = "none";

        //Placing the value in msg 
        if (msg != "") {
            document.getElementById("mEmail").value = msg;
            document.getElementById("mEmail").style.display = "inline";
            return false;
        }
        else
            document.getElementById("mEmail").style.display = "none";

      
        // Phone Number check list //
        var phoneMSG = "";
        var phone = document.getElementById("phone").value;

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
            
        //password check list//

        //Defining variables: password, passwordSize, passwordMSG
        var password = document.getElementById("pw").value;
        var passwordSize = password.length;
        passwordMSG = "";

        //check if the password is too short
        if (passwordSize < 6)
            passwordMSG = "אורך סיסמה קצר מדי";

        //check if the password is too short
        if (passwordSize > 10)
            passwordMSG = "אורך סיסמה ארוך מדי"

        //check if there's at least 1 uppercase letter in password
        if (isUpperCase(password))
            passwordMSG = "סיסמה חייבת להכיל לפחות אות אחת גדולה"; 

        //check if there's at least 1 lowercase letter in password
        if (isLowerCase(password))
            passwordMSG = "סיסמה חייבת להכיל לפחות אות אחת קטנה";

        //check if there's at least 1 digit in password
        if (isdigit(password))
            passwordMSG = "סיסמה חייבת להכיל לפחות ספרה אחת"

        //check's if there's any quot's in password
        if (isQuotPassword(password))
            passwordMSG = "סיסמה אינה יכולה להכיל גרש או גרשיים";

        //checks if there's bad chars in password
        if (isValidStringPassword(password))
            passwordMSG = "סיסמה לא יכולה להכיל תווים אסורים";

        //checks if there's hebrew chars in password
        if (isHebrewPassword(password))
            passwordMSG = "סיסמה לא יכולה להכיל עברית";

        //Placing the value in passwordMSG 
        if (passwordMSG != "") {
            document.getElementById("mPw").value = passwordMSG;
            document.getElementById("mPw").style.display = "inline";
            return false;
        }
        else
            document.getElementById("mPw").style.display = "none";

        //passwordConfirm check//

        
        //Defending variable: passwordConfirm
        var passwordConfirm = document.getElementById("pw1").value;

        //Checks if password and verify password are the same
        if (password != passwordConfirm) {
            document.getElementById("mPasswordCheck").value = "סיסמאות חייבות להיות זהות";
            document.getElementById("mPasswordCheck").style.display = "inline";
            return false;
        }
        else
            document.getElementById("mPasswordCheck").style.display = "none";   

    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>טופס עדכון פרטים</h1>
 <form method="post" runat="server" onsubmit="return chkForm();">
    <table>
        <tr>
            <td>שם משתמש</td>
            <td>
                <input type="text" name="uName" disabled="disabled" value="<%= uName %>" />

            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>שם פרטי:</td>
            <td>
                <input type="text" id="fName"; name="fName" value="<%= fName %>" />

            </td>
            <td>
                <input type="text" id="mFName" size="30"
                    style="display:none; background-color: silver; font-weight:bold;"
                    disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>שם משפחה:</td>
            <td>
                <input type="text" id="lName" name="lName" value="<%= lName %>" />

            </td>
            <td>
                <input type="text" id="mLName" size="30"
                    style="display:none; background-color: silver; font-weight:bold;"
                    disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>כתובת מייל: </td>
            <td>
                <input type="text" id="email" name="email" value="<%= email %>" />
            </td>
            <td>
                <input type="text" id="mEmail" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                        disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>מגדר:</td>
            <td>
                <% if (gender == "male")
                   { %>
            <input type="radio" name="gender" value="male" checked />זכר
             <input type="radio" name="gender" value="female" /> נקבה
               <%   } else { %>
                  <input type="radio" name="gender" value="male" />זכר
                 <input type="radio" name="gender" value="female" checked /> נקבה
                <% }%>        
            </td>
            <td></td>
        </tr>
        <tr>
            <td>שנת לידה: </td>
            <td>
                <select name="yearBorn">
                    <%=yearList %>
                </select>
            </td>
        </tr>
        <tr>
            <td>טלפון: </td>
            <td><input type="text" name="phone" id="phone" size="7" value="<%= phone %>" />
                -
                <select name="perfix" id="perfix">
                    <% if (perfix == "02") {  %>
                        <option value="02" selected>02</option>
                    <% }else { %>
                         <option value="02">02</option>
                    <% }%>

                    <% if (perfix == "03") {  %>
                        <option value="03" selected>03</option>
                    <% }else { %>
                         <option value="03">03</option>
                    <% }%>

                    <% if (perfix == "04") {  %>
                        <option value="04" selected>04</option>
                    <% }else { %>
                         <option value="04">04</option>
                    <% }%>

                    <% if (perfix == "08") {  %>
                        <option value="08" selected>08</option>
                    <% }else { %>
                         <option value="08">08</option>
                    <% }%>

                    <% if (perfix == "09") {  %>
                        <option value="09" selected>09</option>
                    <% }else { %>
                         <option value="09">09</option>
                    <% }%>

                    <% if (perfix == "050") {  %>
                        <option value="050" selected>050</option>
                    <% }else { %>
                         <option value="050">050</option>
                    <% }%>

                    <% if (perfix == "052") {  %>
                        <option value="052" selected>052</option>
                    <% }else { %>
                         <option value="052">052</option>
                    <% }%>

                    <% if (perfix == "054") {  %>
                        <option value="054" selected>054</option>
                    <% }else { %>
                         <option value="054">054</option>
                    <% }%>

                    <% if (perfix == "057") {  %>
                        <option value="057" selected>057</option>
                    <% }else { %>
                         <option value="057">057</option>
                    <% }%>

                   <% if (perfix == "077") {  %>
                      <option value="077" selected>077</option>
                     <% }else { %>
                         <option value="077">077</option>
                    <% }%>
                </select>
            </td>
            <td>
                <input type="text" id="mPhone" size="30"
                    style="display: none; background-color: silver; font-weight: bold;"
                        disabled="disabled" />
            </td>
        </tr>
            <tr>
                <td class="title">עיר מגורים: </td>
                <td>
                    <select name="city" id="city">
                        <% if (city == "חיפה"){ %>
                             <option value="חיפה" selected>חיפה</option>
                        <% }else{ %>
                             <option value="חיפה">חיפה</option>
                        <% } %>
                    
                        <% if (city == "תל אביב"){ %>
                             <option value="תל אביב" selected>תל אביב</option>
                        <% }else{ %>
                             <option value="תל אביב">תל אביב</option>
                        <% } %> 

                        <% if (city == "ירושליים"){ %>
                             <option value="ירושליים" selected>ירושליים</option>
                        <% }else{ %>
                             <option value="ירושליים">ירושליים</option>
                        <% } %> 

                        <% if (city == "מודיעין"){ %>
                             <option value="מודיעין" selected>מודיעין</option>
                        <% }else{ %>
                             <option value="מודיעין">מודיעין</option>
                        <% } %> 

                        <% if (city == "באר שבע"){ %>
                             <option value="באר שבע" selected>באר שבע</option>
                        <% }else{ %>
                             <option value="באר שבע">באר שבע</option>
                        <% } %> 

                        <% if (city == "מטולה"){ %>
                             <option value="מטולה" selected>מטולה</option>
                        <% }else{ %>
                             <option value="מטולה">מטולה</option>
                        <% } %> 

                        <% if (city == "צפון"){ %>
                             <option value="צפון" selected>צפון</option>
                        <% }else{ %>
                             <option value="צפון">צפון</option>
                        <% } %> 

                        <% if (city == "מרכז"){ %>
                             <option value="מרכז" selected>מרכז</option>
                        <% }else{ %>
                             <option value="מרכז">מרכז</option>
                        <% } %> 

                        <% if (city == "דרום"){ %>
                             <option value="דרום" selected>דרום</option>
                        <% }else{ %>
                             <option value="דרום">דרום</option>
                        <% } %> 
                    </select>
                </td>
            </tr>
            <tr>
                <td>תחביבים</td>
                <td>
                    <table style="width:55px;">
                        <tr>
                            <td class="cdHob">
                                  <% if (hob1 == "T") {  %>
                                     <input type="checkbox" name="hobby" value="1" checked="checked" />
                                    <% }else { %>
                                        <input type="checkbox" name="hobby" value="1" />
                                   <% }%> כדורגל
                            </td>
                              <td class="cdHob">
                                <% if (hob2 == "T") {  %>
                                   <input type="checkbox" name="hobby" value="2" checked="checked" />
                                  <% }else { %>
                                      <input type="checkbox" name="hobby" value="2" />
                                 <% }%> כדורסל 
                          </td>
                                 <td class="cdHob">
                                  <% if (hob3 == "T") {  %>
                                     <input type="checkbox" name="hobby" value="3" checked="checked" />
                                    <% }else { %>
                                        <input type="checkbox" name="hobby" value="3" />
                                   <% }%> ריקוד 
                            </td>
                              <td class="cdHob">
                                <% if (hob4 == "T") {  %>
                                   <input type="checkbox" name="hobby" value="4" checked="checked" />
                                  <% }else { %>
                                      <input type="checkbox" name="hobby" value="4" />
                                 <% }%> טניס 
                          </td>
                            <td class="cdHob">
                            <% if (hob5 == "T") {  %>
                               <input type="checkbox" name="hobby" value="5" checked="checked" />
                              <% }else { %>
                                  <input type="checkbox" name="hobby" value="5" />
                             <% }%> פוצ'יוולי
                          </td>
                        </tr>   
                        </table>
                    <tr>
                        <td>סיסמא: </td>
                        <td><input type="password" name="pw" id="pw" size="10" value="<%=pw %>"
                                maxlength="8"; />
                                <span style="color: red; font-size: 2pt;">עד 10 תווים*</span>
                        </td>
                        <td>
                            <input type="text" name="mPw" id="mPw" size="30"
                                style="display: none; background-color: silver; font-weight: bold;"
                                disabled="disabled" />                    
                        </td>
                    </tr>
                    <tr>
                        <td>אימות סיסמה: </td>
                        <td><input type="password" name="pw1" id="pw1" size="10" value="<%=pw %>"
                                maxlength="8"; />
                        </td>
                        <td>
                            <input type="text" name="mPasswordCheck" id="mPasswordCheck" size="30"
                                style="display: none; background-color: silver; font-weight: bold;"
                                disabled="disabled" />                    
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <input type="submit" name="submit" value="update" />
                        </td>
                    </tr>
         </table>
                </form>
    <br />
    <h3><%=sqlSelect %></h3>
    <h3><%=sqlUpdate %></h3>
    <h3><%=msg %></h3>
</asp:Content>
