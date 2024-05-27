using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ugda162
{
    public partial class SimpleQuery : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlSelect = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<div style='text-align: center;'>";
                msg += "<h3>אינך מנהל, אינך רשאי לצפות בדף זה</h3>";
                msg += "<a href='MainPage'>[המשך]</a>";
                msg += "</div>";
            }
            else
            {
                if (Request.Form["submit"] != null)
                {
                    //
                    string field = Request.Form["field"];
                    string value = Request.Form["value"];

                    //
                    string fileName = "usersDB.mdf";
                    string tableName = "usersTbl";

                    //

                    if (field == "gender" || field == "YearBorn" || field == "prefix")
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = '" + value + "');";
                    else
                        if (field == "hobby")
                    {
                        var val = int.Parse(value);
                        switch (val)
                        {
                            case 1: field = "hob1"; break;
                            case 2: field = "hob2"; break;
                            case 3: field = "hob3"; break;
                            case 4: field = "hob4"; break;
                            case 5: field = "hob5"; break;
                        }
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = 'T');";
                    }
                    else
                        if (field == "email")
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " like '%" + value + "%');";
                    else
                        sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " like N'%" + value + "');";

                    DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                    int length = table.Rows.Count;
                    if (length == 0)
                        msg = "לא נמצאו רשומות תואמות לחיפוש";
                    else
                    {
                        st += "<tr>";
                        st += "<th class = 'tblTH' style = 'width: 100px;' >שם משתמש</th>";
                        st += "<th class = 'tblTH' style = 'width: 80px;' >שם משפחה</th>";
                        st += "<th class = 'tblTH' style = 'width: 60px;' >שם פרטי</th>";
                        st += "<th class = 'tblTH' style = 'width: 140px;' >דואל</th>";
                        st += "<th class = 'tblTH' style = 'width: 60px;' >מגדר</th>";
                        st += "<th class = 'tblTH'>שנת לידה</th>";
                        st += "<th class = 'tblTH' style = 'width: 100px;' >טלפון</th>";
                        st += "<th class = 'tblTH'>כדורגל</th>";
                        st += "<th class = 'tblTH'>כדורסל</th>";
                        st += "<th class = 'tblTH'>ריקוד</th>";
                        st += "<th class = 'tblTH'>טניס</th>";
                        st += "<th class = 'tblTH'>פוצ'יוולי</th>";
                        st += "</tr>";

                        for (int i = 0; i < length; i++)
                        {
                            st += "<tr>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["uName"] + "</td>";
                            st += "<td class = 'tblTD2'>" + table.Rows[i]["lName"] + "</td>";
                            st += "<td class = 'tblTD3'>" + table.Rows[i]["fName"] + "</td>";
                            st += "<td class = 'tblTD3' style = 'width: 60px;'>";
                            st += table.Rows[i]["email"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["gender"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["yearBorn"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["perfix"] + "-";
                            st += table.Rows[i]["phone"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["hob1"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["hob2"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["hob3"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["hob4"] + "</td>";
                            st += "<td class = 'tblTD1'>" + table.Rows[i]["hob5"] + "</td>";
                            st += "</tr>";
                        }
                        msg = length + " אנשים עונים לתוצאות החיפוש ";
                    }

                }
            }
        }
    }
}