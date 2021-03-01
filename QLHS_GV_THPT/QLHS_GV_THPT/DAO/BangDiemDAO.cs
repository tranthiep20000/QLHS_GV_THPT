using System.Collections.Generic;
using System.Data;
using QLHS_GV_THPT.DAO;
using QLHS_GV_THPT.DTO;


namespace QuanLyHocSinhTHPT.DAO
{
    class BangDiemDAO
    {
        private static BangDiemDAO instance;

        /// <summary>
        ///  Single 
        /// </summary>
        internal static BangDiemDAO Instance
        {
            get { if (instance == null) instance = new BangDiemDAO(); return instance; }
            private set { instance = value; }
        }

        /// <summary>
        ///Lấy danh sách bảng điểm từ DB 
        ///created by :Nguyễn Văn Hiến
        /// </summary>
        /// <returns>danh sách bảng điểm</returns>
        public List<BangDiemDTO> GetAll()
        {
            List<BangDiemDTO> list = new List<BangDiemDTO>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_BangDiem_GetAll");
            foreach (DataRow item in data.Rows)
            {
                BangDiemDTO entry = new BangDiemDTO(item);
                list.Add(entry);
            }
            return list;
        }

        /// <summary>
        /// Lấy danh sách bảng điểm theo môn học 
        /// </summary>
        /// <param name="idMonHoc"> Mã học phần môn học</param>
        /// <returns>danh sách bảng điểm theo môn học</returns>
        public List<BangDiemDTO> GetByIdMonHoc(int idMonHoc)
        {
            List<BangDiemDTO> list = new List<BangDiemDTO>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_BangDiem_GetByIdMonHoc @idMonHoc", new object[] { idMonHoc });
            foreach (DataRow item in data.Rows)
            {
                BangDiemDTO entry = new BangDiemDTO(item);
                list.Add(entry);
            }
            return list;
        }

        /// <summary>
        /// Thêm thông tin điểm 
        /// </summary>
        /// <param name="diem15phut"> điểm 15 phút</param>
        /// <param name="diem45phut">điểm 45 phút</param>
        /// <param name="diemHocKi">điểm học kì</param>
        /// <param name="idMonHoc">mã học phần môn học</param>
        /// <param name="idHocSinh">mã học sinh</param>
        /// <returns>số thông tin điểm được thêm</returns>
        public bool Insert(float diem15phut, float diem45phut, float diemHocKi, int idMonHoc, int idHocSinh)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_BangDiem_Insert @diem15phut , @diem45phut , @diemHocKi , @idMonHoc , @idHocSinh", new object[] { diem15phut, diem45phut, diemHocKi, idMonHoc, idHocSinh });
            return result > 0;
        }
        public bool Update(int idBangDiem, float diem15phut, float diem45phut, float diemHocKi, int idMonHoc, int idHocSinh)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_BangDiem_Update @idBangDiem , @diem15phut , @diem45phut , @diemHocKi , @idMonHoc , @idHocSinh", new object[] { idBangDiem, diem15phut, diem45phut, diemHocKi, idMonHoc, idHocSinh });
            return result > 0;
        }
        public bool Delete(int idBangDiem)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("SP_BangDiem_Delete @idBangDiem", new object[] { idBangDiem });

            return result > 0;
        }
        public List<BangDiemDTO> Search(string searchValue)
        {
            List<BangDiemDTO> list = new List<BangDiemDTO>();
            DataTable data = DataProvider.Instance.ExecuteQuery("SP_BangDiem_Search @searchValue", new object[] { searchValue });
            foreach (DataRow item in data.Rows)
            {
                BangDiemDTO entry = new BangDiemDTO(item);
                list.Add(entry);
            }
            return list;
        }

    }
}
