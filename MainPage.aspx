<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Ugda162.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
     h1 {color: navy; text-align: center; font-family: 'Guttman Yad-Brush'; font-size: 28pt}
     h2 {font-family: 'Guttman Yad-Brush'; }
     p {font-size: 16pt; color: navy; font-family: 'Guttman Yad-Brush';}
     img{height: 1000px}
  </style>

  <script>
    var backB1 = "pics/backButton1.png";
    var backB2 = "pics/backButton2.png";    
    var backB3 = "pics/backButton3.png";
    setInterval("switchF()", 300);

    function show(str) {
        pic1.src = str;
        pic2.src = str;
        pic3.src = str;
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
    <h1>אוגדה 162</h1>
    <p>עוצבת הפלדה (אוגדה 162) היא אוגדה רב-זירתית הכפופה לפיקוד הדרום של צה"ל ומשוייכת לחיל השריון.</p>
    <p>מפקד האוגדה הנוכחי הוא תת-אלוף איציק כהן</p>
    <p>האוגדה נוסדה בשנת 1971 ופעילה עד היום</p>
    <p>אוגדה 162 נחשבת לחוד החנית של התמרון הקרקעחי של צה"ל ברצועת עזה ומונה כ-6 חטיבות פעילות עליהן אפרט</p>
    <p>האוגדה משוייכת לפיקוד דרום ובסיס האם שלה נמצא במחנה נחל שורק ובמחנה פלוגות</p>
    <h2>מבנה האוגדה</h2>
    <img style="height: 800px" src="pics/mivne.png" />
    <br />
    <a href="YehidotBat.aspx">לעוד מידע על יחידות הבת של האוגדה...</a>
    <br />
    <h2>היסטורית האוגדה</h2>
    <p>האוגדה אורגנה בשנת 1971. ערב מלחמת יום הכיפורים שימשה העוצבה כאוגדה סדירה עם השלמות מילואים בפיקודו של אלוף אברהם (ברן) אדן. היא הורכבה אז מחטיבה 500, חטיבת שריון בפיקודו של אלוף-משנה אריה קרן, חטיבה 460 (חטיבת בית-הספר לשריון) בפיקודו של אל"ם גבי עמיר, וחטיבה 217 בפיקודו של אל"ם נתן (נתק'ה) ניר, שהועברה אליה כתגבורת מאוגדתו המטכ"לית של מוסה פלד אוגדה 146 עקב העברתה של חטיבה 7 מהדרום לרמת הגולן.</p>
    <a href="History.aspx">קרא עוד...</a>
    <br />
    <h2>מפקדי האוגדה</h2>
    <img src="pics/mefakdim.png" />
    <br />
    <a href="MainPage.aspx">
    <img src="pics/backButton.png" style="width:150px; height:50px"/></a>
</asp:Content>
