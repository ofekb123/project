using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ugda162
{
    public partial class ComplexQuery : System.Web.UI.Page
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
                    string field1 = Request.Form["field1"];
                    string field2 = Request.Form["field2"];

                    string value1 = Request.Form["value1"];
                    string value2 = Request.Form["value2"];

                    string op = Request.Form["op"];
                    //שמירת שם מסד הנתונים ושם הטבלה לשימוש השאילתה
                    string fileName = "usersDB.mdf";
                    string tableName = "usersTbl";

                    string qry1 = "";
                    string qry2 = "";
                    //בניית תנאי ראשון
                    if (value1 != null)
                    {
                        if (field1 == "gender" || field1 == "perfix")
                            qry1 = field1 + " = '" + value1 + "'";
                        else if (field1 == "yearBorn")
                            qry1 = field1 + " = " + value1;
                        else if (field1 == "yearFrom")
                            qry1 = "yearBorn" + " >= " + value1;
                        else if (field1 == "hobby")
                        {
                            var val1 = int.Parse(value1);
                            switch (val1)
                            {
                                case 1: field1 = "hob1"; break;
                                case 2: field1 = "hob2"; break;
                                case 3: field1 = "hob3"; break;
                                case 4: field1 = "hob4"; break;
                                case 5: field1 = "hob5"; break;
                            }
                            qry1 = field1 + " = 'T'";
                        }
                        else if (field1 == "email")
                            qry1 = field1 + " like '%" + value1 + "%'";
                        else
                            qry1 = field1 + " like N'" + value1 + "%'";
                    }
                    //בניית התנאי השני
                    if (value2 != null)
                    {
                        if (field2 == "gender" || field2 == "perfix")
                            qry2 = field2 + " = '" + value2 + "'";
                        else if (field2 == "yearBorn")
                            qry2 = field2 + " = " + value2;
                        else if (field2 == "yearFrom")
                            qry2 = "yearBorn" + " >= " + value2;
                        else if (field2 == "hobby")
                        {
                            var val2 = int.Parse(value2);
                            switch (val2)
                            {
                                case 1: field2 = "hob1"; break;
                                case 2: field2 = "hob2"; break;
                                case 3: field2 = "hob3"; break;
                                case 4: field2 = "hob4"; break;
                                case 5: field2 = "hob5"; break;
                            }
                            qry2 = field2 + " = 'T'";
                        }
                        else if (field2 == "email")
                            qry2 = field2 + " like '%" + value2 + "%'";
                        else
                            qry2 = field2 + " like N'" + value2 + "%'";
                    }

                    //בניית השאילתה
                    if (qry1 != "" || qry2 != "")
                    {
                        if (qry1 != "" && qry2 == "")
                            sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + ");";
                        else
                        {
                            if (qry1 == "" && qry2 != "")
                                sqlSelect = "SELECT * FROM " + tableName + " where (" + qry2 + ");";
                            else
                            {
                                if (op == "and")
                                    sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " AND " + qry2 + ");";
                                else
                                    sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " OR " + qry2 + ");";
                            }
                        }
                    }

                    //הפעלת השאילתה
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