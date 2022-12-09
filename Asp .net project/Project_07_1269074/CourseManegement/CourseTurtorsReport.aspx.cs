using Project_07_1269074.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_07_1269074.CourseManegement
{
    public partial class CourseTurtorsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Select * from Courses", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Courses");
                    da.SelectCommand.CommandText = "select * from Tutors";
                    da.Fill(ds, "Tutors");
                    CourseTutorsRpt rpt = new CourseTutorsRpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }


        }
    }
}