using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ugda162
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlAdmin = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string mName = Request.Form["mName"];
                string pw = Request.Form["pw"];

                string fileName = "usersDB.mdf";
                string tableName = "managerTbl";

                sqlAdmin = "SELECT * FROM " + tableName +
                    " WHERE (mName = '" + mName + "' AND pw = '" + pw + "')";

                DataTable table = Helper.ExecuteDataTable(fileName, sqlAdmin);

                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg += "<div style='text-align: center;'>";
                    msg += "<h3>אינך מנהל, אינך רשאי לצפות בדף זה</h3>";
                    msg += "<a href='MainPage.aspx'><img src='pics/backButton1.png' id='pic' class='backButton' alt='backButton' style='height:60px';  /></a>";
                    msg += "</div>";
                }
                else
                {
                    Session["fName"] = "מנהל";
                    Session["admin"] = "yes";
                    Response.Redirect("MainPage");
                }
            }
        }
    }
}