﻿using QLHS_GV_THPT.DAO;
using QLHS_GV_THPT.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLHS_GV_THPT.GUI
{
    class HocSinhDAO
    {
        private static HocSinhDAO instance;

        internal static HocSinhDAO Instance
        {
            get { if (instance == null) instance = new HocSinhDAO(); return instance; }
            private set { instance = value; }
        }
        public List<HocSinhDTO> GetAll()
        {
            List<HocSinhDTO> list = new List<HocSinhDTO>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_HocSinh_GetAll");
            foreach (DataRow item in data.Rows)
            {
                HocSinhDTO entry = new HocSinhDTO(item);
                list.Add(entry);
            }
            return list;
        }
        public bool Insert(string tenHocSinh, string gioiTinh, DateTime ngaySinh, int idLopHoc)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_HocSinh_Insert @tenHocSinh , @gioiTinh , @ngaySinh , @idLopHoc", new object[] { tenHocSinh, gioiTinh, ngaySinh, idLopHoc });
            return result > 0;
        }
    }
}
