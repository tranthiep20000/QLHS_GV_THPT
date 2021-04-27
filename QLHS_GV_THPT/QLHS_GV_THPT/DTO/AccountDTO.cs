using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace QLHS_GV_THPT.DTO
{
    class AccountDTO
    {
        private string Email;
        private string GioiTinh;
        private string Password;

        public string email { get => Email; set => Email = value; }
        public string gioitinh { get => GioiTinh; set => GioiTinh = value; }
        public string password { get => Password; set => Password = value; }

        public AccountDTO()
        {
            // Default constructor
        }

        public AccountDTO(string Email, String GioiTinh, string Password)
        {
            this.Email = Email;
            this.GioiTinh = GioiTinh;
            this.Password = Password;
        }

        public AccountDTO(DataRow row)
        {
            this.Email = row["Email"].ToString();
            this.GioiTinh = row["GioiTinh"].ToString();
            this.Password = row["Password"].ToString();
        }
    }
}
