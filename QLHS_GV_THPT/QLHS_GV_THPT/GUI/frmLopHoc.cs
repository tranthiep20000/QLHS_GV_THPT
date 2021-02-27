using QLHS_GV_THPT.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLHS_GV_THPT.GUI
{
    public partial class frmLopHoc : Form
    {
        BindingSource lopHocList = new BindingSource();

        public frmLopHoc()
        {
            InitializeComponent();
            LoadFirstTime();

        }
        private void LoadFirstTime()
        {
            dgvLopHoc.DataSource = lopHocList;
            LoadListLopHoc();
            EditDataGridView();
            LoadComboboxIdGiaoVienChuNhiem();
            BindingDataToFrom();
        }
        private void LoadListLopHoc()
        {
            lopHocList.DataSource = LopHocDAO.Instance.GetAll();
        }
        private void EditDataGridView()
        {
            dgvLopHoc.Columns["IdLopHoc"].HeaderText = "ID Lớp học";
            dgvLopHoc.Columns["TenLopHoc"].HeaderText = "Tên lớp học";
            dgvLopHoc.Columns["TenKhoi"].HeaderText = "Tên khối";
            dgvLopHoc.Columns["NamHoc"].HeaderText = "Năm học";
            dgvLopHoc.Columns["IdGiaoVienChuNhiem"].HeaderText = "ID Giáo viên chủ nhiệm";
        }
        private void BindingDataToFrom()
        {
            txtIdLopHoc.DataBindings.Add(new Binding("Text", dgvLopHoc.DataSource, "IdLopHoc", true, DataSourceUpdateMode.Never));
            txtTenLopHoc.DataBindings.Add(new Binding("Text", dgvLopHoc.DataSource, "TenLopHoc", true, DataSourceUpdateMode.Never));
            txtTenKhoi.DataBindings.Add(new Binding("Text", dgvLopHoc.DataSource, "TenKhoi", true, DataSourceUpdateMode.Never));
            txtNamHoc.DataBindings.Add(new Binding("Text", dgvLopHoc.DataSource, "NamHoc", true, DataSourceUpdateMode.Never));
            cboIdGiaoVien.DataBindings.Add(new Binding("Text", dgvLopHoc.DataSource, "IdGiaoVienChuNhiem", true, DataSourceUpdateMode.Never));
        }
        private void LoadComboboxIdGiaoVienChuNhiem()
        {
            cboIdGiaoVien.DataSource = GiaoVienDAO.Instance.GetAll();
            cboIdGiaoVien.DisplayMember = "IdGiaoVien";
        }
        private void MakeNull()
        {
            txtIdLopHoc.Text = "";
            txtTenLopHoc.Text = "";
            txtTenKhoi.Text = "";
            txtNamHoc.Text = "";
            txtTimKiem.Text = "";
            LoadComboboxIdGiaoVienChuNhiem();
        }

        private void btnLamTrong_Click(object sender, EventArgs e)
        {
            MakeNull();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string str = txtTimKiem.Text.Trim();
            if (str == "")
            {
                MessageBox.Show("Chưa nhập thông tin tìm kiếm");
                return;
            }
            lopHocList.DataSource = LopHocDAO.Instance.Search(str);
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadListLopHoc();
        }

    }
}
