using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_07_1269074.CourseManegement
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.Sleep(3000);
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var id = DataBinder.Eval(e.Item.DataItem, "TutorId").ToString();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT TutorId FROM Tutors WHERE TutorId={id}", con))
                {
                    con.Open();
                    var dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        var l = e.Item.FindControl("TutorIdLabel") as Label;
                        if (l != null)
                            l.Text = dr[0].ToString();
                        con.Close();
                    }
                }
            }
        }
    }
}