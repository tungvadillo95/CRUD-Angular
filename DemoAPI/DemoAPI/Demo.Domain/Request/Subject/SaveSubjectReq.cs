using System;
using System.Collections.Generic;
using System.Text;

namespace Demo.Domain.Request.Subject
{
    public class SaveSubjectReq
    {
        public int SubjectId { get; set; }
        public string SubjectName { get; set; }
    }
}
