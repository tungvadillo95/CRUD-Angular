using System;
using System.Collections.Generic;
using System.Text;

namespace Demo.Domain.Request.User
{
    public class SaveUserReq
    {
        public int id { get; set; }
        public string fullName { get; set; }
        public bool gender { get; set; }
        public DateTime dob { get; set; }
    }
}
