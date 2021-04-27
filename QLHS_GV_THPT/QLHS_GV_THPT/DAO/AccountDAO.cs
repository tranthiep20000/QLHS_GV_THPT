using System.Collections.Generic;
using System.Data;
using QLHS_GV_THPT.DAO;
using QLHS_GV_THPT.DTO;

namespace QLHS_GV_THPT.DAO
{
    class AccountDAO
    {
        private static AccountDAO instance;

        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set { instance = value; }
        }

        private AccountDAO() { }

        public bool Login(string Email, string Password)
        {
            string query = "TT_QLHS_Login @Email , @Password";

            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] { Email, Password });

            return result.Rows.Count > 0;
        }

        public bool Insert(string Email, string GioiTinh, string Password)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_Account_Insert @Email , @GioiTinh , @Pasword", new object[] { Email, GioiTinh, Password });
            return result > 0;
        }
    }
}
