using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project_07_1269074.BLL
{
    public class CourseAuthor
    {
        SqlConnection con;
        public CourseAuthor()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public ICollection<CourseDTO> GetAll()
        {
            List<CourseDTO> Course = new List<CourseDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Courses", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    Course.Add(new CourseDTO
                    {
                        CourseId = r.Field<int>("courseId"),
                        CourseName = r.Field<string>("courseName"),
                        DurationInWeek = r.Field<int>("durationInWeek"),
                        Fee = r.Field<decimal>("fee"),
                        Available = r.Field<bool>("available"),
                        TutorId = r.Field<int>("tutorId")
                    });
                }
                return Course;
            }

        }
        public void Insert(CourseDTO dto)
        {
            string sql = @"INSERT INTO[dbo].[Courses]
                        ([CourseName]
                       ,[DurationInWeek]
                       ,[Fee]
                       ,[Available]
                       ,[TutorId])
                 VALUES
                       (@CourseName
                       , @DurationInWeek
                       , @Fee
                       , @Available
                       , @TutorId)";
        using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@courseName", dto.CourseName);
                cmd.Parameters.AddWithValue("@durationInWeek", dto.DurationInWeek);
                cmd.Parameters.AddWithValue("@fee", dto.Fee);
                cmd.Parameters.AddWithValue("@available", dto.Available);
                cmd.Parameters.AddWithValue("@tutorId", dto.TutorId);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }
        public void Update(CourseDTO dto) { }
        public void Delete(CourseDTO dto) { }
        public DataTable CourseDropItem()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Tutors", this.con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        public string GetTutorName(int id)
        {
            string sql = "SELECT TutorName FROM Tutors WHERE TutorId=@id";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                try
                {
                    con.Open();
                    string name = cmd.ExecuteScalar().ToString();
                    con.Close();
                    return name;
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                finally
                {
                    if (con.State == ConnectionState.Open) con.Close();
                }
            }
        }
    }
}