using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Ugda162
{
    public partial class Survey : System.Web.UI.Page
    {
        public string str = "";
        public string survay = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["fName"] != null && Session["fName"].ToString() != "אורח")
            {
                if ((bool)Session["voted"])
                {
                    survay = "הנך רשאי להצביע פעם אחת בלבד";
                }
                else
                {
                    if (Request.Form["send"] != null)
                    {
                        str += "<h1>תוצאות הסקר</h1>";

                        string ans = Request.Form["surv"];
                        if (ans == "1")
                            Application["q1"] = (int)Application["q1"] + 1;
                        if (ans == "2")
                            Application["q2"] = (int)Application["q2"] + 1;
                        if (ans == "3")
                            Application["q3"] = (int)Application["q3"] + 1;
                        if (ans == "4")
                            Application["q4"] = (int)Application["q4"] + 1;
                        if (ans=="5")
                            Application["q5"] = (int)Application["q5"] + 1;
                        if (ans== "6")
                            Application["q6"] = (int)Application["q6"] + 1;
                        int[] s = new int[6];
                        s[0] = (int)Application["q1"];
                        s[1] = (int)Application["q2"];
                        s[2] = (int)Application["q3"];
                        s[3] = (int)Application["q4"];
                        s[4] = (int)Application["q5"];
                        s[5] = (int)Application["q6"];
                        int width = 10;
                        double[] w = new double[6];
                        for (int i = 0; i < w.Length; i++)
                            w[i] = s[i] * width;

                        str += "s1 = " + s[0] + ", s2 = " + s[1] + ", s3 = " + s[2] +
                            ", s4 = " + s[3] + "s5 = " + s[4] + "s6 = " + s[5] + "<br>";

                        survay += "<table border ='1' dir = 'ltr'>";

                        survay += "<tr><td align = 'center'> I </td>";
                        survay += "<td width = '500px'><img src='pics/red.png' height ='30px' width = '" + w[0] + "'></td></tr>";

                        survay += "<tr><td align = 'center'> II </td>";
                        survay += "<td width = '500px'><img src='pics/yellow.png' height ='30px' width = '" + w[1] + "'></td></tr>";

                        survay += "<tr><td align = 'center'> III </td>";
                        survay += "<td width = '500px'><img src='pics/blue.png' height ='30px' width = '" + w[2] + "'></td></tr>";

                        survay += "<tr><td align = 'center'> IV </td>";
                        survay += "<td width = '500px'><img src='pics/green.png' height ='30px' width = '" + w[3] + "'></td></tr>";

                        survay += "<tr><td align = 'center'> V </td>";
                        survay += "<td width = '500px'><img src='pics/purple.png' height ='30px' width = '" + w[4] + "'></td></tr>";

                        survay += "<tr><td align = 'center'> VI </td>";
                        survay += "<td width = '500px'><img src='pics/orange.png' height ='30px' width = '" + w[5] + "'></td></tr>";
                        survay += "</table>";

                        Session["voted"] = true;
                    }
                }
            }
            else
            {
                survay += "רק משתמש רשום יכול להצביע";
            }
        }
    
    }
}