using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ugda162
{
    
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string loginMsg;
        protected void Page_Load(object sender, EventArgs e)
        {
            loginMsg = "<h3>שלום ";
            loginMsg += Session["fName"].ToString();
            loginMsg += "</h3>";

            if (Session["fName"].ToString() == "אורח")
            {
                loginMsg += ("<a href='SignUpForm.aspx'><img src='menuPics/signUpButton.png' class='signPics' id='register' onmouseover='showIcon(register, \"menuPics/signUpButton2.png\")' onmouseout='showIcon(register, \"menuPics/signUpButton.png\")'/></a><br />");
                loginMsg += ("<a href='login.aspx'><img src='menuPics/signInButton.png' class='signPics' id='login' onmouseover='showIcon(login, \"menuPics/signInButton2.png\")' onmouseout='showIcon(login, \"menuPics/signInButton.png\")'/></a><br />");
            }
            else if (Session["admin"].ToString() == "yes")
            {
                loginMsg += ("<a href='ManangerPage.aspx'><img src='menuPics/managerButton.png' class='signPics' id='manager' onmouseover='showIcon(manager, \"menuPics/managerButton2.png\")' onmouseout='showIcon(manager, \"menuPics/managerButton.png\")'/></a><br />");
                loginMsg += ("<a href='Logout.aspx'><img src='menuPics/logoutButton.png' class='signPics' id='logout' onmouseover='showIcon(logout, \"menuPics/logoutButton2.png\")' onmouseout='showIcon(logout, \"menuPics/logoutButton.png\")'/></a><br />");
            }
            else
            {
                loginMsg += ("<a href='UpdateUser.aspx'><img src='menuPics/updateButton.png' class='signPics' id='update' onmouseover='showIcon(update, \"menuPics/updateButton2.png\")' onmouseout='showIcon(update, \"menuPics/updateButton.png\")'/></a><br />");
                loginMsg += ("<a href='Logout.aspx'><img src='menuPics/logoutButton.png' class='signPics' id='logout' onmouseover='showIcon(logout, \"menuPics/logoutButton2.png\")' onmouseout='showIcon(logout, \"menuPics/logoutButton.png\")'/></a><br />");
            }
        }
    }
}