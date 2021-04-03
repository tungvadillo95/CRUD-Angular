using System;
using System.Collections.Generic;
using System.Text;

namespace Demo.Domain.Respone.User
{
    public class UserView
    {
        public int id { get; set; }
        public string fullName { get; set; }
        public bool gender { get; set; }
        public string genderStr => gender ? "Nam" : "Nữ";
        public DateTime dob { get; set; }
        public string dobStr { get; set; }
        public string dobVal { get; set; }
    }
}
