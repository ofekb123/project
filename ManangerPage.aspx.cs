using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Ugda162
{
    public partial class ManangerPage : System.Web.UI.Page
    {
        public string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<h3>";
                msg += "אינך מנהל, ";
                msg += "אין לך הרשאה להיכנס לדף הניהול";
                msg += "</h3>";
                msg += "<a href = 'MainPage.aspx'><img src = 'pics/backButton.png' style='height: 60px;' /> </a>";
            }
            else
            {
                msg += "<h3><a href = 'ShowTable.aspx'>[הצגת הטבלה]</a></h3>";
                msg += "<h3><a href = 'SimpleQuery.aspx'>[שאילתה פשוטה]</a></h3>";
                msg += "<h3><a href = 'ComplexQuery.aspx'>[שאילתה מורכבת]</a></h3>";
                msg += "<h3><a href = 'DeleteUser.aspx'>[מחיקת רשומה מהטבלה]</a></h3>";
                msg += "<br />";
                msg += "<a href='MainPage.aspx'><img src='pics/backButton1.png' id='pic' class='backButton' alt='backButton' style='height:60px';  /></a>";

            }
        }
    }
}