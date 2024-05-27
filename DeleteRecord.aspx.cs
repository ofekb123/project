using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Ugda162
{
    public partial class DeleteRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "usersDB.mdf";
            string tableName = "usersTbl";
            if (Session["admin"].ToString() == "yes")
            {
                string uName = Request.QueryString["uName"].ToString();
                string sqlDelete = "DELETE FROM " + tableName + " WHERE uName ='" + uName + "'";
                Helper.DoQuery(fileName, sqlDelete);
            }
            Response.Redirect("DeleteUser.aspx");
        }
    }
}