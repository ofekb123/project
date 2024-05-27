using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ugda162
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlUpdate = "";
        public string sqlSelect = "";

        public string uName, fName, lName, email, perfix, phone, city, gender, pw;
        public string hob1, hob2, hob3, hob4, hob5;
        public string yearList = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "userDB.mdf";
            string tableName = "usersTbl";
            uName = Session["uName"].ToString();

            if (uName == "אורח")
            {
                msg = "אינך רשום במערכת";
                Response.Redirect("MainPage.aspx");

            }
            //שליפת פרטי המשתמש מטבלת הנתונים
            //שאילתת select לאחזור רשומת המשתמש:

            sqlSelect = "SELECT * FROM " + tableName + " WHERE uName = '" + uName + "'";
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

            int yearBorn = Convert.ToInt16(table.Rows[0]["yearBorn"]);
            for (int i = 1980; i <= 2010; i++)
            {
                if (i == yearBorn)
                    yearList += "<option value = '" + i + "' selected = 'selected' >" + i + "</option>";
                else
                    yearList += "<option value = '" + i + "'>" + i + "</option>";
            }

            //בדיקת האם משתמש קיים במערכת   
            int length = table.Rows.Count;
            if (length == 0)
                msg = "אינך רשום במערכת";
            else
            {
                //שליפת נתונים מהרשומה
                fName = table.Rows[0]["fName"].ToString().Trim();
                lName = table.Rows[0]["lName"].ToString().Trim();
                email = table.Rows[0]["email"].ToString().Trim();
                perfix = table.Rows[0]["perfix"].ToString().Trim();
                phone = table.Rows[0]["phone"].ToString().Trim();
                city = table.Rows[0]["city"].ToString().Trim();
                gender = table.Rows[0]["gender"].ToString().Trim();
                hob1 = table.Rows[0]["hob1"].ToString().Trim();
                hob2 = table.Rows[0]["hob2"].ToString().Trim();
                hob3 = table.Rows[0]["hob3"].ToString().Trim();
                hob4 = table.Rows[0]["hob4"].ToString().Trim();
                hob5 = table.Rows[0]["hob5"].ToString().Trim();

                pw = table.Rows[0]["pw"].ToString().Trim();
            }
            if (this.IsPostBack)
            {
                fName = Request.Form["fName"];
                lName = Request.Form["lName"];
                email = Request.Form["email"];
                gender = Request.Form["gender"];
                city = Request.Form["city"];
                perfix = Request.Form["perfix"];
                phone = Request.Form["phone"];
                pw = Request.Form["pw"];

                string hobby = Request.Form["hobby"].ToString();

                hob1 = "F";
                hob2 = "F";
                hob3 = "F";
                hob4 = "F";
                hob5 = "F";

                if (hobby.Contains('1')) hob1 = "T";
                if (hobby.Contains('2')) hob2 = "T";
                if (hobby.Contains('3')) hob3 = "T";
                if (hobby.Contains('4')) hob4 = "T";
                if (hobby.Contains('5')) hob5 = "T";

                sqlUpdate += "UPDATE " + tableName;
                sqlUpdate += " SET fName = '" + fName + "', ";
                sqlUpdate += "lName = '" + lName + "', ";
                sqlUpdate += "email = '" + email + "', ";
                sqlUpdate += "perfix = '" + perfix + "', ";
                sqlUpdate += "yearBorn = " + yearBorn + ", ";
                sqlUpdate += "phone = '" + phone + "', ";
                sqlUpdate += "city = '" + city + "', ";
                sqlUpdate += "gender = '" + gender + "', ";

                sqlUpdate += "hob1 = '" + hob1 + "', ";
                sqlUpdate += "hob2 = '" + hob2 + "', ";
                sqlUpdate += "hob3 = '" + hob3 + "', ";
                sqlUpdate += "hob4 = '" + hob4 + "', ";
                sqlUpdate += "hob5 = '" + hob5 + "', ";

                sqlUpdate += "pw = '" + pw + "' ";
                sqlUpdate += "WHERE uName = '" + uName + "'";

                Helper.DoQuery(fileName, sqlUpdate);

                msg = "sucsses";

            }
        }
    }
}