using QLHS_GV_THPT.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLHS_GV_THPT.DAO
{
    class GiaoVienDAO
    {
        private static GiaoVienDAO instance;

        internal static GiaoVienDAO Instance
        {
            get { if (instance == null) instance = new GiaoVienDAO(); return instance; }
            private set { instance = value; }
        }
        public List<GiaoVienDTO> GetAll()
        {
            List<GiaoVienDTO> list = new List<GiaoVienDTO>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_GiaoVien_GetAll");
            foreach (DataRow item in data.Rows)
            {
                GiaoVienDTO entry = new GiaoVienDTO(item);
                list.Add(entry);
            }
            return list;
        }

    }
}
