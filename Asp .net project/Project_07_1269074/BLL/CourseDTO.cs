using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_07_1269074.BLL
{
    public class CourseDTO
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public int DurationInWeek { get; set; }
        public decimal Fee { get; set; }
        public bool Available { get; set; }
        public int TutorId { get; set; }

    }
}